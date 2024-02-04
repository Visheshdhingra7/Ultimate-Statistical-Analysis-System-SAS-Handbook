/*Chapter 1*/
DATA Distance;
   Meter = 100;
   Kilometers = Meter * 1000;
RUN;

PROC PRINT data=Distance;
RUN;
 

 /*Code*/
data MyDataset; /* Data step begins */
   input Name $ Age Height Weight; /* Define variables */
   datalines; /* Data follows */
Sam 23 165 58
Michel 31 150 50
Tommy 22 170 68
;
run; /* End of data step */
 

 /*Code*/
DATA output (DROP=variables(s) | KEEP=variables(s)); 
SET SAS-dataset ;
RUN;
 
/*Chapter 2*/

 /*Code*/
data MyDataset; /* Data step begins */
   input Name $ Age Height Weight; /* Define variables */
   datalines; /* Data follows */
Sam 23 165 58
Michel 31 150 50
Tommy 22 170 68
;
run; /* End of data step */
 

 /*Code*/
/* Creating a SAS dataset from a raw data file (CSV) */
data MyDataset; /* Creating a SAS dataset named MyDataset */
  infile 'path_to_your_folder/example_data.csv' delimiter=','; /* Specifying the path to your CSV file and the delimiter */
  input Name $ Age; /* Reading variables Name and Age from the CSV file */
run;

/* Displaying the created SAS dataset */
proc print data=MyDataset; 
run;
 


 /*Code*/
data work.mydata;
   infile 'c:\mydata\rawdata.txt';
   input id $ 1-2 name $ 4-13 age 15-16;
run;
 
 /*Code*/
INPUT Name $10. Age 3. Height 5.1 BirthDate MMDDYY10.;
 
 /*Code*/
PROC IMPORT DATAFILE = "file-path/file-name.xlsx" OUT=data_set DBMS=XLSX REPLACE;
 
 /*Code*/
PROC IMPORT OUT= YourNewTable DATAFILE= "myfolder/excelfilename.xlsx" DBMS=xlsx REPLACE; SHEET="Sheet1"; GETNAMES=YES; RUN;
 
    /*Code*/
   DATA myData;
      INFILE 'path/to/myFile.csv' DLM=',' DSD MISSOVER;
      INPUT Name $ Age Height Weight;
   RUN;
    
 /*Code*/
   PROC IMPORT DATAFILE='path/to/yourfile.csv'
      OUT=yourSASdataset
      DBMS=CSV; /* Specify the appropriate DBMS for your file format */
   RUN;
    
    /*Code*/
   PROC IMPORT DATAFILE='path/to/myFile.csv'
      OUT=myData
      DBMS=CSV;
   RUN;
    
      /*Code*/
     PROC EXPORT DATA=your_dataset
        OUTFILE='your_output_file.xlsx'
        DBMS=EXCEL REPLACE;
     RUN;
      
      /*Code*/
     DATA _NULL_;
        SET your_dataset;
        FILE 'your_output_file.txt';
        PUT variable1 variable2;
     RUN;
      
      /*Code*/
     ODS HTML FILE='your_output_file.html';
     PROC PRINT DATA=your_dataset;
     RUN;
     ODS HTML CLOSE;
      
      /*Code*/
     PROC EXPORT DATA=your_dataset
        OUTTABLE='your_oracle_table'
        DBMS=ORACLE REPLACE;
     RUN;
      
 /*Code*/
LIBNAME mydblib ORACLE USER=username PASSWORD=password PATH='your_database_path';
 
 /*Code*/
LIBNAME myodbc ODBC DSN='your_odbc_datasource';
 
 /*Code*/
PROC IMPORT DATAFILE='clinical_data.csv' OUT=clinical_data DBMS=CSV REPLACE;
RUN;
 
 /*Code*/
DATA stock_prices;
   INFILE 'stock_data.txt' MISSOVER TRUNCOVER;
   INPUT StockSymbol $ Price Volume;
RUN;
 
 /*Code*/
PROC EXPORT DATA=sales_data OUTFILE='monthly_sales.xlsx' DBMS=EXCEL REPLACE;
RUN;
 
 /*Code*/
LIBNAME mycloud LIBURI='your_cloud_uri' CLOUDAUTH='your_credentials';
 
 /*Code*/
DATA large_data;
   SET large_dataset;
   /* Enable parallel processing for improved import performance */
   OPTIONS MP_CONNECT=READ;
RUN;
 
 /*Code*/
DATA optimized_data;
   SET large_dataset;
   /* Create an index on the 'CustomerID' variable for faster retrieval */
   INDEX CustomerID;
RUN;
 
 /*Code*/
PROC EXPORT DATA=large_dataset OUTFILE='exported_data.xlsx' DBMS=EXCEL REPLACE COMPRESS=YES;
RUN;
 
 /*Code*/
/* Example of using CAS library for in-memory processing in SAS Viya */
LIBNAME caslib CAS HOST='your_cas_host' PORT=5570 USERNAME='your_username' PASSWORD='your_password';
 
/*Chapter 3*/
      /*Code*/
     PROC MI DATA=your_dataset OUT=missing_info;
        VAR your_variable;
     RUN;
      
   /*Code*/
        PROC MEANS DATA=your_dataset NOPRINT;
           VAR your_variable;
           OUTPUT OUT=imputed_dataset MEAN=imputed_value;
        RUN;
         
 /*Code*/
        PROC MI DATA=your_dataset OUT=imputed_dataset M=5;
           VAR your_variable;
        RUN;
 

 /*Code*/
     DATA YourData;
        SET YourDataset;
        Z_Score = (YourVariable - MEAN(YourVariable)) / STD(YourVariable);
     RUN;
      
      /*Code*/
     PROC UNIVARIATE DATA=YourData WINSOR=0.05;
        VAR YourVariable;
     RUN;
      
      /*Code*/
     PROC MI DATA=YourData OUT=ImputedData;
        VAR YourVariable;
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        NewVariable = Variable1 + Variable2;
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        Month = MONTH(DateVariable);
        Age = INTCK('YEAR', Birthdate, Today(), 'C');
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        Status = IFN(Score >= 70, 'Pass', 'Fail');
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        Category_A = (Category = 'A');
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        FullName = Firstname || ' ' || Lastname;
     RUN;
      
      /*Code*/
     PROC SUMMARY DATA=YourData NWAY;
        VAR Sales;
        OUTPUT OUT=SummaryData SUM=TotalSales;
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        LogTransformedVariable = LOG(YourVariable);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        SqrtTransformedVariable = SQRT(YourVariable);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        RecodedCategory = IFN(YourCategory = 'A', 'Group1', 'Group2');
     RUN;
      
      /*Code*/
     PROC STANDARD DATA=YourData OUT=StandardizedData MEAN=0 STD=1;
        VAR YourVariable;
     RUN;
      
      /*Code*/
     PROC UNIVARIATE DATA=YourData WINSOR=0.05;
        VAR YourVariable;
     RUN;
      

 /*Code*/
     DATA YourData;
        SET YourDataset;
        Total = SUM(Variable1, Variable2, Variable3);
     RUN;
 
      /*Code*/
     DATA YourData;
        SET YourDataset;
        Avg = MEAN(Variable1, Variable2, Variable3);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        RoundedValue = ROUND(YourNumericVariable, 0.01);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        UppercaseName = UPCASE(Name);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        Substring = SUBSTR(Description, 1, 10);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        TrimmedText = TRIM(TextVariable);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        CurrentDate = TODAY();
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        FutureDate = INTNX('MONTH', Today(), 3);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        CurrentTime = TIME();
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        LABEL Gender = 'Gender';
        Gender_Label = PUT(Gender, Gender.);
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        IF Gender = 'Male' THEN Male = 1; ELSE Male = 0;
        IF Gender = 'Female' THEN Female = 1; ELSE Female = 0;
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        FORMAT Education_Level education_fmt.;
     RUN;
      
      /*Code*/
     PROC FORMAT;
        VALUE $StatusFmt 'A' = 'Active' 'I' = 'Inactive';
     RUN;

     DATA YourData;
        SET YourDataset;
        Status_Label = PUT(Status, $StatusFmt.);
     RUN;
      
      /*Code*/
     PROC FREQ DATA=YourData;
        TABLES Category;
     RUN;
      
      /*Code*/
     DATA YourData;
        SET YourDataset;
        IF Frequency(Category) < 10 THEN Category = 'Other';
     RUN;
      
 /*Code*/
DATA StandardizedData;
    SET YourData;
    /* Assuming 'Currency' is a variable indicating the currency type */
    IF Currency = 'EUR' THEN
        StandardizedRevenue = Revenue * 1.12; /* Assuming the exchange rate is 1 USD = 1.12 EUR */
    ELSE IF Currency = 'GBP' THEN
        StandardizedRevenue = Revenue * 1.32; /* Assuming the exchange rate is 1 USD = 1.32 GBP */
    ELSE
        StandardizedRevenue = Revenue; /* Assuming USD is the default currency */
RUN;
 
 /*Code*/
/* Example: Missing Values Check */
PROC FREQ DATA=YourData;
   TABLES _NUMERIC_ / MISSING;
RUN;

/* Example: Duplicate Records Check */
PROC SORT DATA=YourData OUT=NoDuplicates NODUPKEY;
   BY YourKeyVariable(s);
RUN;
 
    /*Code*/
   /* Example: Identifying Duplicate Records */
   PROC SORT DATA=YourData OUT=SortedData NODUPKEY;
      BY YourKeyVariable(s);
   RUN;

   PROC FREQ DATA=SortedData;
      TABLES YourKeyVariable(s) / NOPRINT NOCOL NOROW;
   RUN;
    
    /*Code*/
   /* Example: Removing Duplicate Records */
   PROC SORT DATA=YourData OUT=NoDuplicates NODUPKEY;
      BY YourKeyVariable(s);
   RUN;
    
 /*Code*/
   /* Example: Aggregating Duplicate Data */
   PROC MEANS DATA=YourData NOPRINT;
      BY YourKeyVariable(s);
      VAR YourNumericVariable(s);
      OUTPUT OUT=AggregatedData SUM=YourSumVariable(s);
   RUN;
    
    /*Code*/
   /* Example: Aggregating Duplicate Data */
   PROC MEANS DATA=YourData NOPRINT;
      BY YourKeyVariable(s);
      VAR YourNumericVariable(s);
      OUTPUT OUT=AggregatedData SUM=YourSumVariable(s);
   RUN;
    
    /*Code*/
   /* Example: Flagging Duplicate Records */
   PROC SORT DATA=YourData OUT=FlaggedData DUPOUT=Duplicates;
      BY YourKeyVariable(s);
   RUN;
    
      /*Code*/
     DATA YourData;
        INFILE 'your_input_file.csv' DLM=',' BUFFSIZE=32768; /* Adjust BUFFSIZE as needed */
        INPUT Var1 Var2 Var3;
     RUN;
      
      /*Code*/
     DATA CompressedData (COMPRESS=BINARY);
        SET YourData;
     RUN;
      
      /*Code*/
     PROC DATASETS LIB=YourLibrary;
        MODIFY YourData;
        INDEX CREATE Var1 Var2;
     QUIT;
      
      /*Code*/
     OPTIONS THREADS=4; /* Adjust the number of threads based on available resources */
      
      /*Code*/
     OPTIONS MEMSIZE=4G; /* Allocate 4 gigabytes of memory */
      
      /*Code*/
     PROC SORT DATA=YourData SORTSIZE=100M; /* Adjust SORTSIZE based on available memory */
        BY Var1 Var2;
     RUN;
      
      /*Code*/
     OPTIONS SOURCE SOURCE2 MPRINT SYMBOLGEN;
     DATA YourData;
        /* Your data step code */
     RUN;
      
      /*Code*/
     PROC SQL;
        CREATE TABLE MergedData AS
        SELECT *
        FROM Table1
        INNER JOIN Table2 ON Table1.Key = Table2.Key;
     QUIT;
      
/*Chapter 4*/

 /*Code*/
proc sgplot data=mydata;
   title 'Scatter Plot of Sales vs. Revenue';
   scatter x=Revenue y=Sales;
run;
 
 /*Code*/
proc sgpanel data=mydata;
   title 'Panel Display of Product Sales by Region';
   panelby Region;
   series x=Month y=Sales / group=Product;
run;
 
 /*Code*/
proc sgmap mapdata=mymapdata;
   title 'Choropleth Map of Sales by State';
   choromap / mapid=StateID choro=Sales;
run;
 
 /*Code*/
proc sgplot data=mydata;
   title 'Violin Plot of Customer Satisfaction Scores';
   vpanel / category=Product;
   violin category=Product response=Satisfaction / group=Product;
run;
 
 /*Code*/
proc sgplot data=mytimeseries;
   title 'Annotating Peaks in a Time Series Plot';
   series x=Date y=Sales;
   scatter x=PeakDate y=PeakValue / markerattrs=(symbol=trianglefilled);
   text x=PeakDate y=PeakValue textcolor=red 'Peak';
run;
 
    /*Code*/
   proc sgbar data=mydata;
      title 'Distribution of Customer Ratings';
      vbar Rating / response=Count;
   run;
    
    /*Code*/
   proc sgbar data=mydata;
      title 'Comparison of Sales by Region';
      vbar Sales / group=Region;
   run;
    
    /*Code*/
   proc sgbar data=mydata;
      title 'Product Sales by Region and Quarter';
      vbar Sales / group=Region subgroup=Quarter;
   run;
    
 /*Code*/
proc sgbar data=myproductdata;
   title 'Distribution of Customer Ratings';
   vbar Rating / response=Count;
run;
 
 /*Code*/
proc sgscatter data=mydata;
   title 'Scatter Plot Matrix of Variables';
   matrix x=Var1 Var2 Var3 / diagonal=(histogram) spread;
run;
 
 /*Code*/
/* Example of Customizing Visualizations with ODS Graphics Framework */
ods graphics / reset allattrs;
title 'Customized Graph with ODS Graphics Framework';
proc sgplot data=mydata;
   scatter x=Var1 y=Var2;
   lineparm x=3 y=8 slope=2 / lineattrs=(color=red thickness=2);
run;
 
 /*Code*/
/* Creating an interactive dashboard in SAS Viya */
proc report data=mydata nowd;
  columns Product Sales Profit;
  define Product / group;
  define Sales / sum 'Total Sales';
  define Profit / sum 'Total Profit';
run;
 
 /*Code*/
/* Integrating JavaScript for dynamic features */
data mydata;
  input Category $ Value;
  datalines;
A 30
B 50
C 20
;
run;

ods html5 file="interactive_chart.html" options(embedded='yes');

proc sgplot data=mydata;
  vbar category / response=Value group=Category
    datalabel dataskin=gloss name='myChart';
run;

ods html5 close;
 
 /*Code*/
/* Adding dynamic filtering and drill-downs */
proc sgplot data=mydata;
  scatter x=XVar y=YVar / datalabel=Label;
  dynamicvar XVar;
run;
 

 /*Code*/
/* Using SAS/GRAPH SGANNO for annotation */
proc sgplot data=mydata sganno=anno;
  scatter x=XVar y=YVar / datalabel=Label;
  dynamicvar XVar;

  data anno;
    length function color $ 8;
    xsys = '2'; ysys = '2';
    function = 'label'; position = '5'; color = 'blue'; text = 'Dynamic Annotation';
    output;
  run;
run;
/*Chapter 5*/
 
 /*Code*/
/* SAS Example: One-Sample T-Test */
proc ttest data=bp_data;
   var blood_pressure;
   /* Null Hypothesis: Mean blood pressure is 0 */
   nullmean=0;
run;
 
 /*Code*/
/* SAS Example: One-Way ANOVA */
proc anova data=scores;
   class teaching_method;
   model test_scores = teaching_method;
run;
 
 /*Code*/
/* SAS Example: Wilcoxon Rank-Sum Test */
proc npar1way data=scores wilcoxon;
   class group;
   var test_scores;
run;
 
 /*Code*/
/* SAS Example: Linear Regression */
proc reg data=scores;
   model test_scores = study_hours;
run;
 
 /*Code*/
proc ttest data=mydata;
   class Group;
   var Score;
run;
 
 /*Code*/
proc ttest data=mydata;
   paired Before*After;
run;
 
 /*Code*/
proc ttest data=mydata;
   var Measurement;
   /* specify the hypothesized mean */
   h0 = 50;
   /* one-sample t-test against the hypothesized mean */
   ttest test=h0;
run;
 
 /*Code*/
proc anova data=mydata;
   class Group;
   model Score = Group;
run;
 
 /*Code*/
proc anova data=mydata;
   class FactorA FactorB;
   model Score = FactorA|FactorB;
run;
 
 /*Code*/
proc mixed data=mydata;
   class Subject Time;
   model Score = Time;
   repeated / subject=Subject type=un;
run;
 
 /*Code*/
proc freq data=mydata;
   tables Category / chisq;
run;
 
 /*Code*/
proc freq data=mydata;
   tables Category1*Category2 / chisq;
run;
 
 /*Code*/
proc freq data=mydata;
   tables Category*Group / chisq;
run;
 
 /*Code*/
proc reg data=mydata;
   model DependentVar = IndependentVar;
run;
 
 /*Code*/
proc reg data=mydata;
   model DependentVar = IndependentVar1 IndependentVar2;
run;
 
 /*Code*/
proc reg data=exams;
   model Score = HoursStudied;
run;
 
 /*Code*/
proc reg data=exams;
   model Score = HoursStudied PrepExams;
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X;
   scatter x=X y=Y / fitted;
run;
 
 /*Code*/
proc autoreg data=mydata;
   model Y = X;
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X;
   scatter x=X y=residual / spreadreg;
run;
 
 /*Code*/
proc univariate data=mydata normal;
   var residual;
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X;
   output out=residuals residual=r;
run;

proc sgplot data=residuals;
   scatter x=X y=r / markerattrs=(symbol=circlefilled);
   refline 0 / lineattrs=(color=red);
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X1 X2;
   test X1 = 0, X2 = 0;  /* Null hypothesis: Coefficient is equal to zero */
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X1 X2;
   test / dfnum=2;  /* Number of variables being tested */
run;
 
 /*Code*/
proc logistic data=mydata;
   model Outcome(event='1') = X1 X2;
run;
 
 /*Code*/
proc reg data=mydata;
   model Y = X1 X1*X1;  /* Quadratic term */
run;
 
 /*Code*/
/  Hypothesis Testing - Paired T-Test  /
proc ttest data=mydata;
   paired Before After;
run;

/  Regression Analysis  /
proc reg data=mydata;
   model Sales = MarketingExpenses / clb;
run;
 
 /*Code*/
/* Checking Normality Assumption */
proc univariate data=mydata normal;
   var Residuals;
run;

/* Detecting Multicollinearity */
proc reg data=mydata;
   model Y = X1 X2 X3;
   vif;
run;
 
 /*Code*/
/* Data Cleaning and Preprocessing */
proc sort data=mydata; by ID; run;
proc delete data=cleaned_data; run;
data cleaned_data; set mydata; /* Apply cleaning steps */ run;

/* Variable Selection */
proc reg data=cleaned_data;
   model Y = X1 X2 X3 / selection=stepwise;
run;

/* Validation and Sensitivity Analysis */
/* Perform residual analysis, check influential points, etc. */
 
 /*Code*/
/* Hyperparameter Tuning in SAS Viya */
proc cas;
   sessionCasLib 'casuser' caslib='casuser';
   regression.sgb(
      table={name='mydata' caslib='casuser'},
      inputs={'X1', 'X2', 'X3'},
      target='Y',
      nominals={'X4'},
      varimp={casout={name='varimp' caslib='casuser'}}
   );
run;
 
 /*Code*/
/* L1 Regularization in SAS Viya */
proc cas;
   sessionCasLib 'casuser' caslib='casuser';
   regression.glm(
      table={name='mydata' caslib='casuser'},
      inputs={'X1', 'X2', 'X3'},
      target='Y',
      selection=lasso
   );
run;
 


