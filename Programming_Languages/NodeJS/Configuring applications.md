---
tags:
  - Programming_Languages
  - backend
  - node-js
---
# Configuring applications

We will want to run different processes in the different [environments](./Environments.md) of production, development, and testing. We should specify these in dedicated config files rather than within the main body of our code. 

We can use the third-party [Config](https://github.com/node-config/node-config) package to assist with this. 

We would set up a config directory with the following structure:

```
config/
    default.json
    development.json
    production.json
```

## Example configurations
```json
    // default.json 
    {
        "name": "My Express app"
    }

```

## Referencing config files

```js
const config = require('config')

// Utilise a config variable:

console.log('Application name:' + config.get('name'))

```

If we toggled the different environments, we would see different outputs from the above code (assuming we had different config files in `/config` with different names).

## Managing sensitive configuration items safely 

We will need to store passwords, API keys and other kinds of authentication data for our application. We obviously shouldn't store this data openly in our config files since it would be made public. 

We can do so securely by utilising [environmental variables](../Shell_Scripting/Environmental_and_shell_variables.md).

We create a file called `custom-environment-variables` (must be called this) and map a property to an environmental environment we have already set.

Let's create an environmental variable for a password:
```bash
export APP_PASSWORD='mypassword123'
```

Then in our custom variable file:

```json
{
    "password": "APP_PASSWORD"
}

```