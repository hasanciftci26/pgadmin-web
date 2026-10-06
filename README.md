# PGAdmin Deployment Using `deploy.sh`

This repository includes a deployment script that automates the Cloud Foundry deployment and route configuration for PGAdmin.

The script performs the following actions:

- Deploys the application using `cf push`
- Removes the default route mapping
- Re-maps the route to application port `8080`
- Prints the final PGAdmin URL

## Prerequisites

Before running the script, make sure that:

- The Cloud Foundry CLI (`cf`) is installed.
- You are logged in to the correct SAP BTP Cloud Foundry environment.
- You are targeting the same Cloud Foundry space in which the PostgreSQL service instance is deployed.
- You have permission to deploy applications and manage routes.

You can verify your current target with:

```sh
cf target
```

If necessary, change the organization and space:

```sh
cf target -o <ORG_NAME> -s <SPACE_NAME>
```

## 1. Configure the Deployment Script

Open `deploy.sh` and update the following values according to your target environment:

```sh
APP_NAME="pgadmin-web"
HOSTNAME="pgadmin-dev"
DOMAIN="cfapps.us10-001.hana.ondemand.com"
APP_PORT="8080"
```

Update at least:

- `HOSTNAME` with the desired application hostname.
- `DOMAIN` with the Cloud Foundry domain of your SAP BTP environment.

`APP_NAME` and `APP_PORT` should remain unchanged.

## 2. Make the Script Executable

This step is required only once after cloning the repository:

```sh
chmod +x deploy.sh
```

## 3. Deploy PGAdmin

Run:

```sh
./deploy.sh
```

The script will:

1. Deploy the application with `cf push`.
2. Unmap the existing route.
3. Map the route again using application port `8080`.
4. Display the final PGAdmin URL.

Example output:

```text
Deploying pgadmin-web...
Unmapping existing route...
Mapping route to application port 8080...
Deployment completed successfully.
PGAdmin URL: https://pgadmin-dev.cfapps.us10-001.hana.ondemand.com
```

## 4. Verify the Deployment

Check the application status:

```sh
cf app pgadmin-web
```

The application should be in the `started` state.

You can then access PGAdmin using the URL printed by the deployment script.