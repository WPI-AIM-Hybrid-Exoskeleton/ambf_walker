import math
import numpy as np


class Riener_Muscle():

    def __init__(self, joints=[0, 0, 0], d = [122.0,487.0], k = [0.02*10**(6), 0.00938*10**(6)]):

        self.d_sat = d[0]
        self.d_thr = d[1]
        self.k_thr = k[0]
        self.k_sat = k[1]
        self.joints = ["H", "K", "A"]
        self.prev_ma = self.calc_ma(joints)
        self.muscle_params_index = ["T_ca", "T_fat", "fit_min", "F_max", "L_opt", "C", "epsilon", "vm"]
        self.muscle_vals = {}
        self.muscle_vals["T_ca"] = np.asarray([0.04, 0.04, 0.05, 0.05, 0.03, 0.04, 0.05, 0.07, 0.06])
        self.muscle_vals["T_fat"] = np.asarray([18, 18, 25, 25, 18, 18, 18, 40, 33])
        self.muscle_vals["fit_min"] = np.asarray([0, 0, 0.2, 0.2, 0, 0, 0, 0.5, 0.3])
        self.muscle_vals["F_max"] = np.asarray([1850, 2370, 2190, 400, 1000, 5200, 1600, 3600, 1100])
        self.muscle_vals["l_opt"] = np.asarray([0.146, 0.11, 0.121, 0.173, 0.086, 0.086, 0.054, 0.033, 0.099])
        self.muscle_vals["C"] = np.asarray([0.165, 0.05, 0.09, 0.18, 0.11, 0.04, 0.06, 0.028, 0.09])
        self.muscle_vals["epsilon"] = np.asarray([0.4, 0.5, 0.4, 0.2, 0.4, 0.45, 0.3, 0.5, 0.4])
        self.muscle_vals["vm"] = np.asarray([0.73, 0.54, 0.48, 0.69, 0.51, 0.48, 0.32, 0.1, 0.36])

    def calc_moment(self, d, f, time, theta, dtheta):

        M_ela = self.calc_M_ela(theta)
        M_vis = self.calc_M_vis(dtheta)
        total_toque = np.zeros(3)
        force = self.muscle_force(theta, dtheta)
        a, fit = self.activation(d, f, time)

        muscle_force = a*force*fit

        ma = self.calc_ma(theta)
        active_moments = {"H": 0, "K": 0, "A": 0}

        for joint in self.joints:
            for i in range(9):
                active_moments[joint] += muscle_force[i] * ma[i][joint]

        for i, joint in enumerate(self.joints):
            total_toque[i] = active_moments[joint] + M_ela[joint] #+ M_vis[joint]

        self.prev_ma = ma

        return total_toque

    def activation(self, d, f, t):

        max_d = 999999999
        alpha = 0.1
        beta = 0.6
        T_rec =28.5
        T_del = 0.025

        n1 = (-self.d_thr) * np.arctan(self.k_thr * -self.d_thr) - (-self.d_sat) * np.arctan(self.k_sat * -self.d_sat)

        n2 = (max_d - self.d_thr) * np.arctan(self.k_thr * (max_d - self.d_thr)) - (max_d - self.d_sat) * np.arctan(
            self.k_sat * (max_d - self.d_sat))

        c1 = 1.0 / (n2 - n1)
        c2 = -n1 / (n2 - n1)

        a_r = c1 * ((d - self.d_thr) * np.arctan(self.k_thr * (d - self.d_thr)) - (d - self.d_sat) * np.arctan(
            self.k_sat * (d - self.d_sat))) + c2

        temp = (alpha * f) ** 2

        a_f = temp / (1 + temp)
        a = a_f * a_r

        lambda_t = 1 - beta + beta * (f / 100.0) ** 2.0
        c3 = (a * self.muscle_vals["fit_min"] * lambda_t) / self.muscle_vals["T_fat"] + (1 - a * lambda_t) / T_rec
        c4 = ((a * lambda_t - 1) / T_rec)  -  ((a * lambda_t) / self.muscle_vals["T_fat"])
        c5 = c3 / c4

        fit = -c5 + (1 + c5) * np.exp(c4 * t)

        return a, fit

    def calc_ma(self, theta):

        hip, knee, ankle = theta
        ma = [0]*9

        for i in range(9):
            ma[i] = {}
            for joint in self.joints:
                ma[i][joint] = 0

        ma[0]["H"] = 0.00233 * (hip ** 2) - 0.00233 * hip - 0.0275
        ma[1]["H"] = -0.0098 * (hip ** 2) - 0.0054 * hip + 0.0413
        ma[2]["H"] = -0.020 * (hip ** 2) - 0.024 * hip + 0.055
        ma[4]["H"] = 0.025 * (hip ** 2) + 0.41 * hip - 0.040
        ma[2]["K"] = -0.0098 * (knee ** 2) + 0.021 * knee + 0.028
        ma[3]["K"] = -0.008 * (knee ** 2) + 0.027 * knee + 0.014
        ma[4]["K"] = -0.058 * (math.exp(-2.0 * knee ** 2)) * math.sin(knee) - 0.0284
        ma[5]["K"] = -0.070 * (math.exp(-2.0 * knee ** 2)) * math.sin(knee) - 0.0250
        ma[6]["K"] = 0.018
        ma[6]["A"] = 0.053
        ma[7]["A"] = 0.035
        ma[8]["A"] = 0.013 * ankle - 0.035

        return ma

    def calc_dma(self, dtheta):

        hip, knee, ankle = dtheta
        dma = [0]*9

        for i in range(9):
            dma[i] = {}
            for joint in self.joints:
                dma[i][joint] = 0

        dma[0]["H"] = 2 * 0.00233 * hip - 0.00233
        dma[1]["H"] = 2 * (-0.0098) * hip - 0.0054
        dma[2]["H"] = 2 * (-0.020) * (hip) - 0.024
        dma[4]["H"] = 2 * 0.025 * hip + 0.41
        dma[2]["K"] = 2 * (-0.0098) * (knee) + 0.021
        dma[3]["K"] = 2 * (-0.008) * knee + 0.027
        dma[4]["K"] = -0.058 * (
                math.exp(-2.0 * knee ** 2) * math.cos(knee) - 4.0 * math.sin(knee) * math.exp(-2.0 * knee ** 2))
        dma[5]["K"] = -0.070 * (
                math.exp(-2.0 * knee ** 2) * math.cos(knee) - 4.0 * math.sin(knee) * math.exp(-2.0 * knee ** 2))
        dma[6]["K"] = 0
        dma[6]["A"] = 0
        dma[7]["A"] = 0
        dma[8]["A"] = 0.013

        return dma

    def calc_M_ela(self, theta):

        hip, knee, ankle = theta
        M_ela = {}
        ankle = 0

        M_ela["H"] = math.exp(2.1080 - 0.0160 * knee - 0.0195 * hip) \
                     - math.exp(-2.1784 + 0.070 * knee + 0.1349 * hip) - 15.24


        M_ela["K"] = math.exp(1.0372 + 0.0040 * ankle - 0.0494 * knee - 0.0250 * hip) \
                     - math.exp(-1.1561 - 0.0020 * ankle + 0.0254 * knee + 0.003 * hip) \
                     + math.exp(2.5 - 0.25 * knee) + 1.0

        M_ela["A"] = math.exp(2.0111 - 0.0833 * ankle - 0.009 * knee) \
                      - math.exp(-9.925 + 0.2132 * ankle) - 2.970

        return M_ela

    def calc_M_vis(self, dtheta):

        hip, knee, ankle = dtheta
        M_vis = {}

        M_vis["H"] = 2.0 * hip
        M_vis["K"] = 1.0 * knee
        M_vis["A"] = 0.6 * ankle

        return M_vis

    def contraction_velocity(self, theta, dtheta):

        ma = self.calc_ma(theta)
        v = np.zeros(9)
        vel = {}
        vel["H"] = dtheta[0]
        vel["K"] = dtheta[1]
        vel["A"] = dtheta[2]

        for i in range(9):
            for joint in self.joints:
                v[i] += vel[joint] * ma[i][joint] / self.muscle_vals["vm"][i]

        return v

    def muscle_force(self, theta, dtheta):

        l = self.calc_length(theta)

        fl = np.exp(- ( (l - 1.0) / self.muscle_vals["epsilon"] )**2)

        v = self.contraction_velocity(theta, dtheta)
        fv = 0.54 * np.arctan(5.69 * v + 0.51) + 0.745

        return fv * fl * self.muscle_vals["F_max"]

    def calc_length(self, theta):

        theta = np.asarray(theta)
        ma = self._intergrate_ma(theta)
        l = np.zeros(9)

        for i in range(9):
            l[i] = self.muscle_vals["C"][i]
            for joint in self.joints:
                l[i] += ma[i][joint]
        return l / self.muscle_vals["l_opt"]

    def _intergrate_ma(self, theta):

        h = 0.01
        k1 = self.calc_ma(theta)
        k2 = self.calc_ma(theta + 0.5 * h)
        k3 = self.calc_ma(theta + 0.5 * h)
        k4 = self.calc_ma(theta + h)
        ma = [0]*9

        for i in range(9):
            ma[i] = {}
            for joint in self.joints:
                ma[i][joint] = self.prev_ma[i][joint] + (h / 6.0) * (
                        k1[i][joint] + 2 * k2[i][joint] + 2 * k3[i][joint] + k4[i][joint])

        return ma
