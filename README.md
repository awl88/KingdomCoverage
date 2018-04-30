# KingdomCoverage

## A program to provide affordable and full coverage to all species, and all occupants within the Realm.

## Collaborators
#### Andrew Lyon([awl88](https://github.com/awl88)), Eli Harper([EliHarper](https://github.com/EliHarper)), Andrew Dufresne([addufres](https://github.com/addufres)), Rebecca Allen([RAAllen](https://github.com/RAAllen))

## Setup/Installation requirements

* If you want to interact with the finished program, please visit: [Kingdom Coverage](INSERT_URL_HERE_WHEN_UPLOADED).
* In order to edit this project and work with it on your own machine you will need a terminal application such as Terminal or Bash. Since this project has a Gradle and Spring nature, you will need to have the [Spring Tool Suite](https://spring.io/tools) installed. You will also need a database server program such as [MAMP](https://www.mamp.info/en/) and a web server program such as [Apache](https://www.apache.org/).
* Start by opening the terminal application and typing the command
```
git clone https://github.com/awl88/KingdomCoverage.git
```
after navigating with the `cd` command to the location you would like the project to be cloned into.
* Use the terminal application to navigate to the project directory you just cloned down off of GitHub using the "cd" command.
* If at any point during this next part of the set up process you get a popup system window to enter a password, it is asking for your computer user account password. Start by opening up your MAMP or LAMP. From the preferences menu of the application, select "Ports" and "Set Web and MySQL ports to 80 & 3306". Select to "Start Servers" from the main window of your application. Return to your terminal, you will need to set up the included games.sql database in order to correctly interact with this program. You will be typing a series of commands in the terminal.
```
mysql -u root -p < games.sql
mysql -u root -p
```
* You will then be prompted to enter a password in the terminal, type `root`.
```
mysql> CREATE USER admin@localhost IDENTIFIED BY 'admin';
mysql> exit;
mysql -u admin -p
```
* You will then be prompted to enter a password in the terminal, type `admin`. You can now use mysql syntax to interact with the database.
* From this point on you should be able to edit the program and see changes when altering it in the Spring Tool Suite.


## Program Behavior/Specifications

### Insurance Client
* The user will be able to log in as a client if they are a client.
* The client will be directed to a page showing their insurance policies and messages.
* The client will be able to submit new messages to their agent.
* The client will be able to update one of their policies.
* The client will be able to create a new policy for themselves.
* The client will be able to delete a message.

### Insurance Agent
* The user will be able to log in as an agent if they are an agent.
* The agent will be directed to a page showing their clients and messages.
* The agent will be able to click on their clients and see more details about that client.
* The agent will be able to update one of their client's policies.
* The agent will be able to create a new policy for their client.
* The agent will be able to delete a message.

## Support and Contact Details

_Please contact [Rebecca Allen](RebeccaZarsky@gmail.com), [Andrew Dufresne](anlyon99@gmail.com), [Eli Harper](eli.harper@gmail.com) or [Andrew Lyon](adufresplatinum@gmail.com) for technical questions or assistance running the program._


## Technologies Used

_This program was made utilizing Java, MySQL, MySQLWorkbench, HTML, CSS, Gradle, Spring Tool Suite, Apache, Atom and the Eclipse Integrated Development Environment._

## License

_This program is licensed under the MIT license._

Copyright (c) 2018 **_Rebecca Allen, Andrew Dufresne, Eli Harper, and Andrew Lyon_**
