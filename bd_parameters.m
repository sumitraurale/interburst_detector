%-------------------------------------------------------------------------------
% parameters for the inter-burst detector
%
% Sumit Raurale, PhD
% Infant Centre, University College Cork
% Started: 26-09-2019
%
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% 1. feature set 
%-------------------------------------------------------------------------------

clear FEATURE_SET_FINAL;

FEATURE_SET_FINAL(1).name='fd-higuchi';	FEATURE_SET_FINAL(1).params=[];
FEATURE_SET_FINAL(2).name='edo';        FEATURE_SET_FINAL(2).params=[];
FEATURE_SET_FINAL(3).name='envelope';  	FEATURE_SET_FINAL(3).params=[0 1 0 0 0];
FEATURE_SET_FINAL(4).name='envelope';	FEATURE_SET_FINAL(4).params=[0 0 1 0 0];
FEATURE_SET_FINAL(5).name='envelope';	FEATURE_SET_FINAL(5).params=[0 0 0 1 0];
FEATURE_SET_FINAL(6).name='envelope';	FEATURE_SET_FINAL(6).params=[0 0 0 0 1];
FEATURE_SET_FINAL(7).name='if';	        FEATURE_SET_FINAL(7).params=[0 0 0 0 1];
FEATURE_SET_FINAL(8).name='psd_r2';     FEATURE_SET_FINAL(8).params=[0 0 0 0 1];
FEATURE_SET_FINAL(9).name='spec-power';	FEATURE_SET_FINAL(9).params=[0 0 0 0 1];


%---------------------------------------------------------------------
% 2. parameters for SVM 
%    DO NOT EDIT: indexing corresponds to features above
%---------------------------------------------------------------------
clear lin_svm_params_st;
% linear regression parameters:
lin_svm_param_st.coeff(1)=0.215040433137114;
lin_svm_param_st.coeff(2)=0.734226737040750;
lin_svm_param_st.coeff(3)=0.489064905620473;
lin_svm_param_st.coeff(4)=0.038611969363180;
lin_svm_param_st.coeff(5)=0.005284505175217;
lin_svm_param_st.coeff(6)=0.587163618061157;
lin_svm_param_st.coeff(7)=0.016787607818015;
lin_svm_param_st.coeff(8)=0.107305912669800;
lin_svm_param_st.coeff(9)=0.093615301073322;

lin_svm_param_st.bias=0.542268452632279;

% z-score parameters:
lin_svm_param_st.x_shift(1)=0.172444309741349;
lin_svm_param_st.x_shift(2)=1.577960640074521;
lin_svm_param_st.x_shift(3)=0.720357351554502;
lin_svm_param_st.x_shift(4)=0.659242254003057;
lin_svm_param_st.x_shift(5)=0.546441268776176;
lin_svm_param_st.x_shift(6)=0.427542841897232;
lin_svm_param_st.x_shift(7)=0.070521450856017;
lin_svm_param_st.x_shift(8)=0.039148789361843;
lin_svm_param_st.x_shift(9)=0.976031722488547;

lin_svm_param_st.x_scale(1)=1.511142736152260;
lin_svm_param_st.x_scale(2)=0.477845901724355;
lin_svm_param_st.x_scale(3)=2.774764142853859;
lin_svm_param_st.x_scale(4)=1.194574147392405;
lin_svm_param_st.x_scale(5)=0.844066972193971;
lin_svm_param_st.x_scale(6)=0.642885093718805;
lin_svm_param_st.x_scale(7)=0.667471679297595;
lin_svm_param_st.x_scale(8)=0.076312792966628;
lin_svm_param_st.x_scale(9)=4.204918726972005;

% trim off start and end of detector output (as features use
% short-time windowing approach): 
WIN_TRIM=1.0;   % in seconds


%---------------------------------------------------------------------
% 3. filter details (IIR Butterworth filter)
%---------------------------------------------------------------------
L_FILTER_ORDER=5;    
% band-pass filter in this band    
FBANDS=[0.5 30; 0.5 4; 4 7; 7 13; 13 30]; 


%---------------------------------------------------------------------
% 2. use either static (1) or adaptive (0) threshold:
%---------------------------------------------------------------------
STATIC_THRES=1;


%---------------------------------------------------------------------
% 3. post-processing to force minimum duration IBI and bursts:
%---------------------------------------------------------------------
% set to 0 to turn off: (in seconds)
MIN_IBI_DUR=1.5;
MIN_BURST_DUR=1.0;
