FILE *fp;
float32 a = 0;
float32 b = 0;
float32 a0 = 0;
float32 b0 = 0;
float32 y = 0;
int go = 1;
fp = fopen("c:\\temp\\height.txt", "r");
while (go > 0) {
	if (fscanf(fp, "%f\t%f\t\n", &a, &b) > 0) {
		if (go == 1) {
			go = 2;
			if (x < a) {
				y = b;
				go = 0;
			}
			a0 = a;
			b0 = b;
		} else {
			if ((a0 <= x) && (x < a)) {
				y = b0 + (b-b0)*(x-a0)/(a-a0);
				go = 0;
			}
			a0 = a;
			b0 = b;
		}
	} else {
		go = 0;
		y = b0;
	}
}
fclose(fp);
return y;
