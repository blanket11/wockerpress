# wockerpress
Local development environment for wordpress created with docker.

---

## Overview

### 1 - Rename .env-example to .env .
```
$ cp .env-example .env
```

### 2 - Edit the .env file appropriately.

### 3 - Run your containers.
```
$ docker-compose up -d
```

### 4 - Open your browser and visit localhost: http://localhost.


---

## SSL server certificate configuration.

### 1 - Issue a certificate with mkcert

You only need to do this once as this is done on your macPC.

#### Install mkcert with homebrew.
```
$ brew install mkcert
```


#### Install nss with homebrew.
(if you use Firefox.)

```
$ brew install nss
```

#### Install local CA.
A local CA file will be generated in `/Users/username/Library/Application Support/mkcert`.
```
$ mkcert -install
```

### 2 - Issue a certificate for this project.

#### Go to the `certs` directory
```
$ cd ./certs
```

#### Issue the certificate
```
$ mkcert localhost 127.0.0.1
```


### 3 - Run the shell script to reflect to the container.

Run `/scripts/ssl.sh` in the project folder.

```
$ cd ../
$ sh ./scripts/ssl.sh
```

---

## How to use wordmove.

### 1 - Connect to container.

Change `wordmove_container_name` to the name of the container you want to use for wordmove.

```
$ docker exec -w /home/ -it wordmove_container_name /bin/bash
```

### 2 - When using SSH public key authentication.

Use ssh-agent to configure the settings.

Start ssh-agent.
```
$ ssh-agent bash
```

Register ssh-agent.
The path for id_rsa should match your environment.
```
$ ssh-add /home/.ssh/id_rsa
```

### 3 - Run wordmove.

#### Pull production data.
```
$ wordmove pull -e production --all
```

### Push production data.
```
$ wordmove push -e production --all
```

---

## Example of checking email in a local environment

### 1 - Install the WordPress plugin "WP Mail SMTP by WPForms".

[WP Mail SMTP by WPForms](https://wordpress.org/plugins/wp-mail-smtp/)

### 2 - Add the constant to wp-config.php in your local environment.
Add it after `/* That's all, stop editing! Happy publishing. */`.

```
define( 'WPMS_ON', true );
define( 'WPMS_SMTP_HOST', 'mailhog' );
define( 'WPMS_SMTP_PORT', 1025 );
define( 'WPMS_SSL', '' );
define( 'WPMS_SMTP_AUTH', false );
define( 'WPMS_SMTP_AUTOTLS', false );
define( 'WPMS_MAILER', 'smtp' );
```

### 3- To confirm receipt of your email, please go to http://localhost:8025/.

## How to backup SQL

### Export SQL file

Executing the dump.sh file will export a SQL file in the "sql" directory with the name "dump.sql".

```
$ sh ./scripts/dump.sh
```

### Importing SQL files

Execute the import-sql.sh file to read the "dump.sql" file and import the SQL.

```
$ sh ./scripts/import-sql.sh
```
