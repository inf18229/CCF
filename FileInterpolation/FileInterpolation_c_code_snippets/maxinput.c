FILE *fp;
float32 a = 0;
float32 b = 0;
float32 mx = 0;
fp = fopen("c:\\temp\\height.txt", "r");
while (fscanf(fp, "%f\t%f", &a, &b) > 0) {
	mx = a;
}
fclose(fp);
return mx;
