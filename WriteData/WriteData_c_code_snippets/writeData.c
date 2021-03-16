FILE *fp;
fp = fopen("c:\\Temp\\data.csv", "a");

if(fp == NULL) {
	printf("Datei konnte nicht geoeffnet werden.\n");
}else {
	// schreibe Zahlen
	fprintf(fp, "%f,%f\n", x,y);
	fclose(fp);
}
