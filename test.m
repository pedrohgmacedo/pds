x = rand(1E4,1); h = randn(42,1); k = 42;
tic; phg_overlap_conv(x,h,k); toc;