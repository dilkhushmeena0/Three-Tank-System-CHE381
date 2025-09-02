Kc = 15;
tau_i = 191.822;
tau_d = 2;
sim('Lab_5_CHE381_220007.slx',1000);
error_data = load('Lab_5_error_data.mat');
errors_in_time=error_data.ans;
time = errors_in_time(1,:);
errors= errors_in_time(2,:);
IAE = trapz(time,abs(errors));