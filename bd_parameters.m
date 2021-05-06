%-------------------------------------------------------------------------------
% parameters for the inter-burst detector
% 
% John M. O' Toole,
% edited by, Sumit Raurale, PhD
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
lin_svm_param_st.coeff(1)=0.0967659687421726;
lin_svm_param_st.coeff(2)=1.36778034277916;
lin_svm_param_st.coeff(3)=0.307905144503155;
lin_svm_param_st.coeff(4)=-0.0695372377521123;
lin_svm_param_st.coeff(5)=-0.0753260857476928;
lin_svm_param_st.coeff(6)=0.425899319743395;
lin_svm_param_st.coeff(7)=-0.0549320786785131;
lin_svm_param_st.coeff(8)=0.0456232547864798;
lin_svm_param_st.coeff(9)=-0.223036526073974;

lin_svm_param_st.bias=0.547935339724541;

% z-score parameters:
lin_svm_param_st.x_shift(1)=-1.51002318431465;
lin_svm_param_st.x_shift(2)=-0.461152692123518;
lin_svm_param_st.x_shift(3)=2.76485473836567;
lin_svm_param_st.x_shift(4)=1.17068582075060;
lin_svm_param_st.x_shift(5)=0.822618232339856;
lin_svm_param_st.x_shift(6)=0.654907274448431;
lin_svm_param_st.x_shift(7)=0.667221966047684;
lin_svm_param_st.x_shift(8)=0.0576040232449750;
lin_svm_param_st.x_shift(9)=-4.19416451554619;

lin_svm_param_st.x_scale(1)=0.186456443260142;
lin_svm_param_st.x_scale(2)=1.48046670269053;
lin_svm_param_st.x_scale(3)=0.747785934841392;
lin_svm_param_st.x_scale(4)=0.699854649003213;
lin_svm_param_st.x_scale(5)=0.583673853399804;
lin_svm_param_st.x_scale(6)=0.467308061525048;
lin_svm_param_st.x_scale(7)=0.0775528828708503;
lin_svm_param_st.x_scale(8)=0.0416253075034754;
lin_svm_param_st.x_scale(9)=1.03198235219561;


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
