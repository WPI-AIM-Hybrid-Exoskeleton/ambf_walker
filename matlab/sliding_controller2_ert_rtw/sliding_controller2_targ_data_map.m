  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 16;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (sliding_controller2_P)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Km1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_P.dampener
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 49;
	
	  ;% sliding_controller2_P.exo_sat
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 53;
	
	  ;% sliding_controller2_P.human_sat
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 54;
	
	  ;% sliding_controller2_P.invMd
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 55;
	
	  ;% sliding_controller2_P.lambda2
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 104;
	
	  ;% sliding_controller2_P.rho2
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 153;
	
	  ;% sliding_controller2_P.spring
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 202;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_d
	  section.data(1).logicalSrcIdx = 9;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.exo_Y0
	  section.data(1).logicalSrcIdx = 10;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.human_Y0
	  section.data(1).logicalSrcIdx = 11;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_a
	  section.data(1).logicalSrcIdx = 12;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_j
	  section.data(1).logicalSrcIdx = 13;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(7) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Out1_Y0
	  section.data(1).logicalSrcIdx = 14;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(8) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_b
	  section.data(1).logicalSrcIdx = 15;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(9) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_e
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(10) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_bi
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(11) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.Constant_Value_o
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(12) = section;
      clear section
      
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.exotau_Y0
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_P.humantau_Y0
	  section.data(2).logicalSrcIdx = 20;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_P.Constant_Value_l
	  section.data(3).logicalSrcIdx = 21;
	  section.data(3).dtTransOffset = 2;
	
	  ;% sliding_controller2_P.Constant_Value_ou
	  section.data(4).logicalSrcIdx = 22;
	  section.data(4).dtTransOffset = 3;
	
	  ;% sliding_controller2_P.Constant_Value_p
	  section.data(5).logicalSrcIdx = 23;
	  section.data(5).dtTransOffset = 4;
	
	  ;% sliding_controller2_P.Integrator1_IC
	  section.data(6).logicalSrcIdx = 24;
	  section.data(6).dtTransOffset = 5;
	
	  ;% sliding_controller2_P.Integrator_IC
	  section.data(7).logicalSrcIdx = 25;
	  section.data(7).dtTransOffset = 12;
	
	  ;% sliding_controller2_P.surfacewidthSMC_Gain
	  section.data(8).logicalSrcIdx = 26;
	  section.data(8).dtTransOffset = 13;
	
	  ;% sliding_controller2_P.Constant_Value_c
	  section.data(9).logicalSrcIdx = 27;
	  section.data(9).dtTransOffset = 14;
	
	  ;% sliding_controller2_P.Constant_Value_f
	  section.data(10).logicalSrcIdx = 28;
	  section.data(10).dtTransOffset = 15;
	
	  ;% sliding_controller2_P.Constant_Value_k
	  section.data(11).logicalSrcIdx = 29;
	  section.data(11).dtTransOffset = 16;
	
	  ;% sliding_controller2_P.SineWaveFunction_Amp
	  section.data(12).logicalSrcIdx = 30;
	  section.data(12).dtTransOffset = 17;
	
	  ;% sliding_controller2_P.SineWaveFunction_Bias
	  section.data(13).logicalSrcIdx = 31;
	  section.data(13).dtTransOffset = 18;
	
	  ;% sliding_controller2_P.SineWaveFunction_Freq
	  section.data(14).logicalSrcIdx = 32;
	  section.data(14).dtTransOffset = 19;
	
	  ;% sliding_controller2_P.SineWaveFunction_Phase
	  section.data(15).logicalSrcIdx = 33;
	  section.data(15).dtTransOffset = 20;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(13) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.EnabledSubsystem_i.Out1_Y0
	  section.data(1).logicalSrcIdx = 34;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(14) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_P.EnabledSubsystem_l.Out1_Y0
	  section.data(1).logicalSrcIdx = 35;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(15) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
	      
	    ;% Dm1
	    section.nData = 1;
	    section.data(1).logicalSrcIdx = 36;
	    section.data(1).dtTransOffset = 0;
	  
	    nTotData = nTotData + section.nData;
	    paramMap.sections(16) = section;
	    clear section
	  
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 20;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (sliding_controller2_B)
    ;%
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.msg
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.In1
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_B.In1_j
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.In1_a
	  section.data(1).logicalSrcIdx = 3;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.msg_o
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.qd_add
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.qd_add_n
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 7;
	
	  ;% sliding_controller2_B.exosateration
	  section.data(3).logicalSrcIdx = 10;
	  section.data(3).dtTransOffset = 14;
	
	  ;% sliding_controller2_B.humansateration
	  section.data(4).logicalSrcIdx = 11;
	  section.data(4).dtTransOffset = 21;
	
	  ;% sliding_controller2_B.K
	  section.data(5).logicalSrcIdx = 12;
	  section.data(5).dtTransOffset = 28;
	
	  ;% sliding_controller2_B.B
	  section.data(6).logicalSrcIdx = 13;
	  section.data(6).dtTransOffset = 77;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.Add
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.Add_c
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 2;
	
	  ;% sliding_controller2_B.Sum
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.SourceBlock_o1
	  section.data(1).logicalSrcIdx = 14;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.SourceBlock_o1_h
	  section.data(2).logicalSrcIdx = 15;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_B.SourceBlock_o1_c
	  section.data(3).logicalSrcIdx = 16;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.EnabledSubsystem_i.In1
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(7) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.EnabledSubsystem_l.In1
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(8) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction1_je.y
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(9) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction_a.y
	  section.data(1).logicalSrcIdx = 20;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(10) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction1_j.y
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(11) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction_p.y
	  section.data(1).logicalSrcIdx = 22;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(12) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction1_h.y
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(13) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction_o.y
	  section.data(1).logicalSrcIdx = 24;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(14) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction1.y
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(15) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_MATLABFunction.y
	  section.data(1).logicalSrcIdx = 26;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(16) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_humanright.knee
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.sf_humanright.dknee
	  section.data(2).logicalSrcIdx = 28;
	  section.data(2).dtTransOffset = 2;
	
	  ;% sliding_controller2_B.sf_humanright.ankle
	  section.data(3).logicalSrcIdx = 29;
	  section.data(3).dtTransOffset = 4;
	
	  ;% sliding_controller2_B.sf_humanright.danke
	  section.data(4).logicalSrcIdx = 30;
	  section.data(4).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(17) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_humanleft.knee
	  section.data(1).logicalSrcIdx = 31;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.sf_humanleft.dknee
	  section.data(2).logicalSrcIdx = 32;
	  section.data(2).dtTransOffset = 2;
	
	  ;% sliding_controller2_B.sf_humanleft.ankle
	  section.data(3).logicalSrcIdx = 33;
	  section.data(3).dtTransOffset = 4;
	
	  ;% sliding_controller2_B.sf_humanleft.danke
	  section.data(4).logicalSrcIdx = 34;
	  section.data(4).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(18) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_exoright.knee
	  section.data(1).logicalSrcIdx = 35;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.sf_exoright.dknee
	  section.data(2).logicalSrcIdx = 36;
	  section.data(2).dtTransOffset = 2;
	
	  ;% sliding_controller2_B.sf_exoright.ankle
	  section.data(3).logicalSrcIdx = 37;
	  section.data(3).dtTransOffset = 4;
	
	  ;% sliding_controller2_B.sf_exoright.danke
	  section.data(4).logicalSrcIdx = 38;
	  section.data(4).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(19) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% sliding_controller2_B.sf_exoleft.knee
	  section.data(1).logicalSrcIdx = 39;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_B.sf_exoleft.dknee
	  section.data(2).logicalSrcIdx = 40;
	  section.data(2).dtTransOffset = 2;
	
	  ;% sliding_controller2_B.sf_exoleft.ankle
	  section.data(3).logicalSrcIdx = 41;
	  section.data(3).dtTransOffset = 4;
	
	  ;% sliding_controller2_B.sf_exoleft.danke
	  section.data(4).logicalSrcIdx = 42;
	  section.data(4).dtTransOffset = 6;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(20) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 8;
    sectIdxOffset = 20;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (sliding_controller2_DW)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.obj
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.obj_m
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_DW.obj_mp
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_DW.obj_n
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.obj_h
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_DW.obj_c
	  section.data(2).logicalSrcIdx = 5;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_DW.obj_g
	  section.data(3).logicalSrcIdx = 6;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.obj_k
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.EnabledSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_DW.EnabledSubsystem2_SubsysRanBC
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_DW.EnabledSubsystem1_SubsysRanBC
	  section.data(3).logicalSrcIdx = 10;
	  section.data(3).dtTransOffset = 2;
	
	  ;% sliding_controller2_DW.EnabledSubsystem_SubsysRanBC_c
	  section.data(4).logicalSrcIdx = 11;
	  section.data(4).dtTransOffset = 3;
	
	  ;% sliding_controller2_DW.Controller_SubsysRanBC
	  section.data(5).logicalSrcIdx = 12;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
      section.nData     = 10;
      section.data(10)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.objisempty
	  section.data(1).logicalSrcIdx = 13;
	  section.data(1).dtTransOffset = 0;
	
	  ;% sliding_controller2_DW.objisempty_n
	  section.data(2).logicalSrcIdx = 14;
	  section.data(2).dtTransOffset = 1;
	
	  ;% sliding_controller2_DW.objisempty_o
	  section.data(3).logicalSrcIdx = 15;
	  section.data(3).dtTransOffset = 2;
	
	  ;% sliding_controller2_DW.objisempty_oz
	  section.data(4).logicalSrcIdx = 16;
	  section.data(4).dtTransOffset = 3;
	
	  ;% sliding_controller2_DW.objisempty_h
	  section.data(5).logicalSrcIdx = 17;
	  section.data(5).dtTransOffset = 4;
	
	  ;% sliding_controller2_DW.objisempty_d
	  section.data(6).logicalSrcIdx = 18;
	  section.data(6).dtTransOffset = 5;
	
	  ;% sliding_controller2_DW.objisempty_c
	  section.data(7).logicalSrcIdx = 19;
	  section.data(7).dtTransOffset = 6;
	
	  ;% sliding_controller2_DW.objisempty_a
	  section.data(8).logicalSrcIdx = 20;
	  section.data(8).dtTransOffset = 7;
	
	  ;% sliding_controller2_DW.EnabledSubsystem_MODE
	  section.data(9).logicalSrcIdx = 21;
	  section.data(9).dtTransOffset = 8;
	
	  ;% sliding_controller2_DW.Controller_MODE
	  section.data(10).logicalSrcIdx = 22;
	  section.data(10).dtTransOffset = 9;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.EnabledSubsystem_i.EnabledSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(7) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% sliding_controller2_DW.EnabledSubsystem_l.EnabledSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 24;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(8) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 1728082948;
  targMap.checksum1 = 4041347945;
  targMap.checksum2 = 2363488853;
  targMap.checksum3 = 1414351142;

