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
lin_svm_param_st.coeff(1)=0.096690851818645;
lin_svm_param_st.coeff(2)=1.374549315982956;
lin_svm_param_st.coeff(3)=0.310052055509963;
lin_svm_param_st.coeff(4)=-0.065335339529749;
lin_svm_param_st.coeff(5)=-0.086388361035396;
lin_svm_param_st.coeff(6)=0.430759705431190;
lin_svm_param_st.coeff(7)=-0.053054511203928;
lin_svm_param_st.coeff(8)=0.043129503821157;
lin_svm_param_st.coeff(9)=-0.217456904171171;

lin_svm_param_st.bias=0.547934380031329;

% z-score parameters:
lin_svm_param_st.x_shift(1)=-1.509094921008394;
lin_svm_param_st.x_shift(2)=-0.452136708187513;
lin_svm_param_st.x_shift(3)=2.764327019065411;
lin_svm_param_st.x_shift(4)=1.174831563294955;
lin_svm_param_st.x_shift(5)=0.828834495197632;
lin_svm_param_st.x_shift(6)=0.653462003574326;
lin_svm_param_st.x_shift(7)=0.667824764642791;
lin_svm_param_st.x_shift(8)=0.057335130997401;
lin_svm_param_st.x_shift(9)=-4.194406214984080;

lin_svm_param_st.x_scale(1)=0.185439656377677;
lin_svm_param_st.x_scale(2)=1.478916050607285;
lin_svm_param_st.x_scale(3)=0.746802605547493;
lin_svm_param_st.x_scale(4)=0.700346173451193;
lin_svm_param_st.x_scale(5)=0.582938191016048;
lin_svm_param_st.x_scale(6)=0.465541114648944;
lin_svm_param_st.x_scale(7)=0.077356525083303;
lin_svm_param_st.x_scale(8)=0.041522907230086;
lin_svm_param_st.x_scale(9)=1.023852427561276;

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
