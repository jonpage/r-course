				    ATUS (TU) 
				     tu.txt

Section Listing

1. Survey Definition
2. Flat files listed in the survey directory.
3. Time series, series file, data file, mapping file, & aspect file definitions and relationships
4. Series file format and field definitions
5. Data file format and field definitions
6. Mapping file formats and field definitions
7. Aspect file format and field definitions

================================================================================
Section 1
================================================================================

Survey Description:  The American Time Use Survey (ATUS) is the Nation’s first 
federally administered, continuous survey on time use in the United States. The 
goal of the survey is to measure how people divide their time among life’s activities.

In ATUS, individuals are randomly selected from a subset of households that have 
completed their eighth and final month of interviews for the Current Population 
Survey (CPS). ATUS respondents are interviewed only one time about how they spent 
their time on the previous day, where they were, and whom they were with. The survey 
is sponsored by the Bureau of Labor Statistics and is conducted by the U.S. Census Bureau.

The major purpose of ATUS is to develop nationally representative estimates of how
people spend their time. Many ATUS users are interested in the amount of time
Americans spend doing unpaid, nonmarket work, which could include unpaid childcare,
eldercare, housework, and volunteering. The survey also provides information on the
amount of time people spend in many other activities, such as religious activities,
socializing, exercising, and relaxing.

Summary Data Available:  Time Use data are available for the civilian, noninstitutional 
population age 15 and older and various subpopulations, with estimates available by
age, race, sex, Hispanic or Latino ethnicity, employment status, occupation, class of 
worker, earnings, education, day of week, and other characteristics.
 
Frequency of Observations:  Most series are annual averages. Quarterly averages, not 
seasonally adjusted, are available for a small number of data series. All series are 
released on an annual basis.

Data Characteristics:  Time use estimates are constructed for a number of different 
activities. There are 3 main types of ATUS estimates: average hours per day, participation 
rates on an average day, and number of persons. 

All series contain estimates constructed using the 2006 weighting methodology. Some 
series may contain data that do not match earlier published estimates from news 
release tables that used previous weighting methods.

ATUS estimates are not published unless there are a minimum number of respondents 
representing the given population. Beginning with the 2010 data, additional publication 
criteria are applied that include the number of respondents who reported doing a 
specified activity and the standard error or coefficient of variation for the estimate. 
Estimates that are suppressed are indicated with a value "S." Estimates that are 
considered “close to zero” or that round to zero (e.g., 0.00 for estimates of hours), 
are indicated with a value "Z." 

Some, but not all data series contain estimates that use the 2010 suppression rules 
for all years. Other series may contain estimates constructed before 2010 that used 
earlier suppression methods. As a result, some series may contain suppressions and 
"close to zero" values that were previously published in the ATUS news release tables. 

Updating Schedule:  Updates are usually available with the issuance of the annual 
American Time Use Survey news release. 

References:  ATUS User's Guide, U.S. Department of Labor, Bureau of Labor Statistics
www.bls.gov/tus/atususersguide.pdf.

==================================================================================
Section 2
==================================================================================

The following ATUS files are on the BLS internet in the sub-directory pub/time.series/tu:

	tu.contacts		-  Contacts for TU survey
	tu.actcode		-  Activity codes mapping file
	tu.age			-  Age codes mapping file
	tu.aspect		-  Standard errors for data
	tu.data.0.Current	-  All current data
	tu.data.1.AllData	-  All data
	tu.datays		-  Number of years codes mapping file
	tu.disability		-  Disability codes mapping file
	tu.earn			-  Earnings codes mapping file
	tu.ecage		-  Eldercare age codes mapping file
	tu.ecytd		-  Eldercare provided on diary day codes mapping file
	tu.educ			-  Educational attainment codes mapping file
	tu.elder		-  Eldercare provider codes mapping file
	tu.eldur		-  Eldercare duration codes mapping file
	tu.elfreq		-  Eldercare frequency codes mapping file
	tu.elnum		-  Eldercare number of recipients codes mapping file
	tu.elwho		-  Eldercare recipients relationship codes mapping file
	tu.footnote		-  Footnote codes mapping file
	tu.hhnscc03		-  Secondary childcare codes mapping file
	tu.industry		-  Industry codes mapping file
	tu.lfstat		-  Labor force status codes mapping file
	tu.lfstatw		-  Labor force status and work on diary day codes mapping file
	tu.maritlstat		-  Marital status codes mapping file
	tu.mjcow		-  Class of worker codes mapping file
	tu.nmet			-  Metropolitan area codes mapping file
	tu.occ			-  Occupation codes mapping file
	tu.orig			-  Ethnicity and country of origin codes mapping file
	tu.pertype		-  Days of week codes mapping file
	tu.prhhchild		-  Presence of household child codes mapping file
	tu.prownhhchild		-  Presence of own household child codes mapping file
	tu.race			-  Race codes mapping file
	tu.region		-  Region codes mapping file
	tu.schenr		-  School enrollment codes mapping file
	tu.series		-  All series ids and their beginning and end dates
	tu.sex			-  Sex codes mapping file
	tu.sjmj			-  Single or Multiple jobholder codes mapping file
	tu.stattype		-  Type of estimate codes mapping file
	tu.timeday		-  Time of day codes mapping file
	tu.where		-  Where codes mapping file
	tu.who			-  Who codes mapping file
	tu.work			-  Worked on diary day codes mapping file

       	
=================================================================================
Section 3
=================================================================================

The definition of a time series, its relationship to and the interrelationship
among series, data and mapping files is detailed below:

A time series refers to a set of data observed over an extended period of time
over consistent time intervals (i.e. monthly, quarterly, semi-annually, annually).
ATUS time series data are produced annually. Quarterly and annual estimates are produced.

The flat files are organized such that data users are provided with the following
set of files to use in their efforts to interpret data files:

a)  a series file (only one series file per survey)
b)  mapping files
c)  data files
d)  aspect file

The series file contains a set of codes which, together, compose a series 
identification code that serves to uniquely identify a single time series.  
Additionally, the series file contains the following series-level information:

a) the period and year corresponding to the first data observation 
b) the period and year corresponding to the most recent data observation 
c) characteristics of the series corresponding to values in the mapping files

The mapping files are definition files that contain explanatory text descriptions
that correspond to each of the various codes represented within each series
identification code.

The data file contains one line of data for each observation period pertaining to 
a specific time series.  Each line contains a reference to the following:

a) a series identification code
b) year in which data is observed
c) period for which data is observed (A01 indicate annual averages, and 
   Q01, Q01, Q03, Q04 indicate quarterly averages)
d) value
e) footnote code (if available)

The aspect file contains one line of data (standard error) for each observation period pertaining to 
a specific time series. Each line contains a reference to the following:

a) a series identifiation code
b) year in which the standard error is observed
c) period for which the standard error is observed
d) aspect type (E indicates standard error)
d) value of the standard error
e) footnote codes (if applicable)

=================================================================================
Section 4
=================================================================================
Series File Structure and Format:  The following represents the file format used to 
define tu.series. Data files are in ASCII text format. Data elements are separated 
by tabs. The first record of each file contains the column headers for the data
elements stored in each field. Each record ends with a new line character. 

Field #/Data Element	Length		Value(Example)		

1.  series_id		  18		TUU10101AA01011987

	Description of the components in the series id

2.  prefix		  2             TU

3.  seasonal code	  1		U

4.  type of estimate code 5		10101

5.  time period code	  1		A

6.  all ATUS data series  1		A		
						
7.  number of years code  2		01

8.  character code*	  6		011987			
				
The character code (011987) in the series_id corresponds to a unique combination of 
values from the mapping files. For example, activity, day of week, age, sex, etc. 
There is not a field titled "character_code" in the series file. Rather there are a
number of fields that correspond to each of the mapping files and a series_title 
field that describes the data series.

Additional fields in the Series file correspond to each of the mapping files and 
information about the period for which the data series are defined.

9.  begin_year		  4		2003	

10. begin_period	  3		A01

11. end_year		  4             2013

12. end_period		  3		A01
					


==================================================================================
Section 5
==================================================================================
Data File Structure and Format:  The following represents the file format used to define
each data file. Note that the field numbers are for reference only; they do not 
exist in the database. Data files are in ASCII text format. Data elements are 
separated by tabs. The first record of each file contains the column headers for 
the data elements stored in each field. Each record ends with a new line character.  

The tu.data file is partitioned into two separate files:  

	1.  tu.data.0.Current	- All current data
	2.  tu.data.1.AllData	- All data

The above-referenced data files have the following format:

Field #/Data Element	Length		Value(Example)		

1. series_id		  18		TUU10101AA01011987

2. year			   4		2004	

3. period		   3		A01		

4. value		  12      	3.66	 	
				 
5. footnote_codes	  10		It varies


=================================================================================
Section 6
=================================================================================
Mapping File Structure and Format:  The following represents the file format used to 
define each mapping file. Note that the field numbers are for reference only; they 
do not exist in the database. Mapping files are in ASCII text format. Data elements 
are separated by tabs. The first record of each file contains the column headers 
for the data elements stored in each field. Each record ends with a new line character. 

Each mapping file follows a similar format

Field #/Data Element		Length		Value (Example)

1. characteristic code 		varies		varies

2. characteristic text		varies		varies


For example, the tu.age mapping file contains

1. age_code			3		033

2. age_text			17		25 to 54 years


==================================================================================
Section 7
==================================================================================
Aspect File Structure and Format:  The following represents the file format used to 
define the aspect file. Note that the field numbers are for reference only; they do 
not exist in the database. The aspect file is in ASCII text format. Data elements are 
separated by tabs. The first record of each file contains the column headers for 
the data elements stored in each field. Each record ends with a new line character.  


The aspect file has the following format:

Field #/Data Element	Length		Value(Example)		

1. series_id		  18		TUU10101AA01011987

2. year			   4		2014	

3. period		   3		A01

4. aspect_type		   1		E		

5. value		  12      	0.052	 	
				 
6. footnote_codes	  10		It varies