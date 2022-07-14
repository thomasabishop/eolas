---
tags:
  - Programming_Languages
  - backend
  - node-js
---

# Managing environments 

With a full-scale Node application you will typically run three environments:
* Development
* Testing
* Production

## Accessing the current environment

To determine the current environment we can use the variable **`process.env.NODE_ENV`**. This works globally regardless of the kind of Node app we are building. 

If you have not manually set up your environments, **`process.env.NODE_ENV`** will return `undefined`.

### Setting the Node environment
#### For the session
`NODE_ENV` is a bash [environment variable](/Programming_Languages/Shell_Scripting/Environmental_and_shell_variables.md) like any other. So we can set it in the normal way:

```bash
export NODE_ENV=production
```

### In Express
In Express, there is a built in method for retrieving the current envrionment: `app.get('env')`. Express will default to the development environment. 

<p style="color:red">! How to keep Express and Node environment in sync?</p>

## Configuring environments 

We use the third-party [Config](https://github.com/node-config/node-config) package to manage different configurations based on the environment. 

Once installed we set up a dedicated config directory with a structure as follows:

```
config/
    default.json
    development.json
    production.json
```

For example: 

```json
// default.json 
{
    "name": "My Express app"
}
```
Then to utilise config variables:

```js
const config = require('config')
console.log('Application name:' + config.get('name'))
```

If we toggled the different environments, we would see different outputs from the above code (assuming we had different config files in `/config` with different names).

### Sensitive config data

We will need to store passwords, API keys and other kinds of authentication data for our application. We obviously shouldn't store this data openly in our config files since it would be made public. 

We can do so securely by utilising [environmental variables](../Shell_Scripting/Environmental_and_shell_variables.md) alongside the config pacakage.

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

We can then safely reference this value in the course of our normal code:
```js
console.log(config.get('password'))
```

<p style="color:red">! But how would this be achieved in a production server?</p>


<p style="color:red">! And how could we do this programmatically at the start of a local development session without manually setting each environment variable in the terminal?</p>