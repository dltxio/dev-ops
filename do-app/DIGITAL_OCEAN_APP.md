# [Digital Ocean App Platform](https://docs.digitalocean.com/products/app-platform/)

## Description
Automate the deployment of your app using the App Platform without having to manually configure any servers or sites.\
Works by first scanning your GitHub repo and looking for common build/run commands (customisable), then waiting for a push against the `main` branch before executing those commands to automatically build and deploy your app\
Extra info [here](https://docs.digitalocean.com/products/app-platform/languages-frameworks/nodejs/). Example ExpressJS app [here](https://github.com/digitalocean/sample-expressjs)

### Instructions
1. Create the app on DO [here](https://cloud.digitalocean.com/apps/) and connect it up using GitHub (requires SSO between your GH and DO accounts)
2. Follow the wizard leaving all the defaults for now - this will produce a failed build. Don't worry
3. Go to the Settings page on your app and scroll down to see "App Spec" and click "Edit" to get the yaml config on the screen. 
4. Click the download button to get a copy of the config, open it in a text editor, and apply appropriate changes from one of the example files below based on your app requirements
  * Back-end only: `.do/nestjs-template.yaml`, 
  * Front-end only: `.do/react-template.yaml`, 
  * Full-stack: `.do/fullstack-template.yaml` or 
  * Full-stack + PostGresDB: `.do/fullstack-db-template.yaml` 
5. Re-upload the changed file, which will kick-off a re-build and deploy of you app (hopefully with success)
6. Optional - you can change the deployed domain and other things on the Settings page
7. Commit your final working yaml to your GitHub repo in a `.do/`folder (in the event the project needs to be redeployed from scratch)

### (Optional) If you require DM migrations for your app
1. Install pgAdmin4 https://www.pgadmin.org/
2. Once pgAdmin is running, select "Add new server"
3. Add the server details found in the DLTX Digital Ocean account (https://cloud.digitalocean.com/databases/db-postgresql-sgp1-16621?i=7cba59)
4. Once connected select the DB you wish to run migration scripts on
5. Then from the top menu bar click "Tools" and "Query Tool"
6. Then it reload the page. Above the menubar on the left, you see the folder-icon (look picture below). Click on them and choose your .sql file
7. Click on select and the file is uploaded
8. To execute the .sql file, press F5 or the play button above the menubar in the middle
9. Right click on your database and click on 'Refresh'

### (Optional) If the domain the app is hosted on is not on DO
1. In the settings section of the app select “edit” on “Domains” and then “+ Add Domain”
2. On the new page enter your Domain or Subdomain Name
3. Then select “You manage domain”
4. Copy the CNAME Alias shown and create a CNAME record on the platform the DNS is hosted on, with the name being where you want to direct to (eg “app.product.io”) and the content as the CNAME Alias copied previously.
5. Once the CNAME record is set up head back over to the DO app where you should still be on the “Add Domain” page and select “Add Domain”
6. Now when you select “edit” on “Domains” you will see the new domain as either “pending” (this can take around 10 mins) or active
