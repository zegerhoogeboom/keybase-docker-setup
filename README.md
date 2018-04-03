## :key: Keybase Docker Setup :key:

This setup allows the usage of Keybase from Docker in a scripted way, i.e. no manual steps are required.
The usecase for this is to use the Keybase API from your dockerized applications, e.g. a Slack-like chat bot.
It is required for Keybase to be installed on the host and to be logged in if you wish to be automatically logged in
in the container. Note that copying the Keybase configuration does not log in Keybase in the container so even though
you your host is logged into Keybase it is still required to pass the password to the `keybase-login.sh` script.
The Keybase configuration from the host is used which is assumed to be located at `~/.config/keybase`.
The `./build.sh` script requires `sudo` as the Keybase configuration directory is (temporarily)
mounted into the local `keybaseconfig` directory which is a way to allow the Docker context to
copy the Keybase configuration to the container.

### Instructions

- [Optional] Verify that your Keybase configuration is actually `~/.config/keybase`. Note that this assumes you are
building the image using the same user as you installed Keybase with.
- Run `./build.sh`.
- Check if everything worked: `docker run --rm -it zegerhoogeboom/keybase expect keybase-login.sh your_keybase_password && keybase status`.
It should say "Logged in: yes".
