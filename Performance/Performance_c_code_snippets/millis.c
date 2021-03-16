struct timeval start;
gettimeofday(&start, NULL);
float32 t = ((float32) start.tv_usec)/1000;
return t;
