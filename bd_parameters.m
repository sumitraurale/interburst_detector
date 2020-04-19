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
FEATURE_SET_FINAL(1).name='envelope';	FEATURE_SET_FINAL(1).params=[0 1 0 0 0];
FEATURE_SET_FINAL(2).name='fd-higuchi';	FEATURE_SET_FINAL(2).params=[];
FEATURE_SET_FINAL(3).name='edo';        FEATURE_SET_FINAL(3).params=[];
FEATURE_SET_FINAL(4).name='if';	        FEATURE_SET_FINAL(4).params=[0 0 0 0 1];
FEATURE_SET_FINAL(5).name='psd_r2';     FEATURE_SET_FINAL(5).params=[0 1 0 0 0];
FEATURE_SET_FINAL(6).name='envelope';	FEATURE_SET_FINAL(6).params=[0 0 0 0 1];
FEATURE_SET_FINAL(7).name='envelope';	FEATURE_SET_FINAL(7).params=[0 0 0 1 0];
FEATURE_SET_FINAL(8).name='spec-power';	FEATURE_SET_FINAL(8).params=[0 0 0 0 1];


%---------------------------------------------------------------------
% 2. parameters for SVM 
%    DO NOT EDIT: indexing corresponds to features above
%---------------------------------------------------------------------
clear lin_svm_params_st;
% linear regression parameters:
lin_svm_param_st.coeff(1)=;
lin_svm_param_st.coeff(2)=;
lin_svm_param_st.coeff(3)=;
lin_svm_param_st.coeff(4)=;
lin_svm_param_st.coeff(5)=;
lin_svm_param_st.coeff(6)=;
lin_svm_param_st.coeff(7)=;
lin_svm_param_st.coeff(8)=;
lin_svm_param_st.bias=;

% z-score parameters:
lin_svm_param_st.x_shift(1)=;
lin_svm_param_st.x_shift(2)=;
lin_svm_param_st.x_shift(3)=;
lin_svm_param_st.x_shift(4)=;
lin_svm_param_st.x_shift(5)=;
lin_svm_param_st.x_shift(6)=;
lin_svm_param_st.x_shift(7)=;
lin_svm_param_st.x_shift(8)=;
lin_svm_param_st.x_scale(1)=;
lin_svm_param_st.x_scale(2)=;
lin_svm_param_st.x_scale(3)=;
lin_svm_param_st.x_scale(4)=;
lin_svm_param_st.x_scale(5)=;
lin_svm_param_st.x_scale(6)=;
lin_svm_param_st.x_scale(7)=;
lin_svm_param_st.x_scale(8)=;

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
