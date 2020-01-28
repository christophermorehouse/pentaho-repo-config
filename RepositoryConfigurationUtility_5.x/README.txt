2014-08-01 Christopher Morehouse

For a list of changes in each version, see the changelog located under the /engine folder.

 
*************************
*How to run the utility:*
*************************
1) Make sure the DI Server and/or BA Server has been shutdown before running the utility. Failure to do this may result in the Tomcat's WEB-INF/web.xml being deleted.
 
2) Edit the ConnectionInfo.properties file with the path location of your BA or DI Server as well as the database connection information where your Hibernate, Quartz, Jackrabbit, and Pentaho Operations Mart databases exists.

3) Execute the StartRepositoryConfiguration.bat file if running on Windows. If running in Linux, make sure the StartRepositoryConfiguration.sh file has the execute bit enabled, and run the following command: ./StartRepositoryConfiguration.sh

4) If the utility has run successfully, you should see a "Repository configuration process ran successfully!" message, otherwise you'll get "Repository configuration process failed. Please Check ConfigurationRun.log".

5) A ConfigurationRun.log file is generated in the same directory as the StartRepositoryConfiguration.bat/sh script. If the utility fails, you can check here to examine the errors further.

 
**************************
*Behavior of the utility:*
**************************
1) Information is read from the ConnectionInfo.properties file to find where BA Server or DI Server /pentaho-solutions directory and /tomcat directory are located.

2) In the ConnectionInfo.properties file, you specify what database type you’re using and the credentials for the jackrabbit, hibernate, quartz, and pentaho_operations_mart databases. Only Oracle, MySQL, and PosgreSQL are supported.

3) The utility then figures out all the files it needs to edit and backs them up in the /backups folder before touching anything.

4) The utility will recreate all the necessary configuration files with the information from the ConnectionInfo.properties file.

5) The utility will copy over edited Tomcat startup scripts, located under /engine/Tomcat Startup Scripts, that has the Java Xms value set to 4GB, the Xmx value set to 6GB, and has the PENTAHO_INSTALLED_LICENSE_PATH environment variable added. If your server cannot handle these memory levels, please adjust the values accordingly in these files.

6) Cache files will be deleted, so you can run the utility over and over again on the same installation directory with different values in the properties file with no adverse effects.

 
***************
*Common Issue:*
***************

Upon running the utility, you get a variation of the following error in the console as well as in the ConfigurationRun.log file:

ERROR: File/folder [filePath] does not exist!

or

ERROR : Destination folder does not exist!

This is due to incorrect values entered in the ConnectionInfo.properties file. Possible causes:

1) You've configured an invalid "SolutionsDirectory" or "TomcatDirectory" path.

2) You've configured the "servertype" property as "di" and you are running the utility against a BA Server, or vice versa (configured "ba" against a DI Server), or you have a different value altogether than the acceptable "di" and "ba" values.

3) You've configured the "databasetype" property with an invalid value. Only "oracle", "mysql", and "postgresql" are acceptable.

Make sure these three items have been corrected and run the utility again.