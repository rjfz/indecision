# Indecision

## Purpose

Indecision is a web based application which serves as an electronic voting system for university classes.
Indecision was made in order to support lecturers in affirming the level of which students understand lesson content.

## Dependencies

- Docker

## How to Run

Make sure you have the required dependencies on your machine already.

In your IDE terminal enter: `git clone https://github.com/rjfz/indecision.git`

Once the repository is cloned onto your machine, in your terminal, go to the root of the cloned folder and run `docker-compose up`. This will bring up the application and it's dependencies.

After this, you can run `rails db:create`, `rails db:migrate`, and `rails db:seed` in that order. They must be ran in the `web` container.

The details are as follows
  - email: fake3@fakemail.com
  - password: password

The seed file specifies a default admin account. This admin account can then be used in order to assign roles to other
users and to assign user subjects to them using the admin panel.

## How to create a Lobby

- Once you have created an account or signed in, you will be redirected to the 'create a lobby' section. This section is
  the signed in view of the platform.

- The initial page is the list of available subjects, click on the subject you wish to make a lobby for.

- From here you will be taken to a list of available modules, you may also create a module as signified by the create
  button at the top of the page. Assuming there is a module created, click the desired module.

- The list of lessons will then be displayed, it has the same layout as the list of modules. You can create a lesson from
  the top of the page. Assuming there is a lesson already, click the desired lesson.

- This shows all the existing lobbies. To create a new lobby click the 'Create Lobby' button at the top of the page.
  If the button is greyed out, this implies there are invalid or no questions. From here, click 'Edit Lesson' to add or
  alter questions.

- Once you have clicked 'Create Lobby', enter a name for the lobby, the date and select the academic year. You can then
  confirm the creation and it will redirect you to a lobby page with a code for users to join with!

## How to join a Lobby

- The lecturer should have the lobby view displayed which shows a 6 character code. Enter this code on the homepage of
  Indecision. This will then redirect you to the lobby. Characters are not case sensitive.

## Notable Models

### Subject

  - Subject is the highest level in the model hierarchy. A subject is a general association grouping modules together.
    An example of a Subject is 'Computer Science' which would then have modules made belonging to it.

### Module

  - A Module belongs to a Subject. A module is a topic which contains a collection of lessons.
    An example of a Module would be 'Java Programming Foundations' which would then have lessons made belonging to it.

### Lesson

  - A Lesson belongs to a Module. A lesson is a section of a module which has instances of itself defined as lobbies.
    An example of a lesson would be 'Lesson 1: Introduction' which would then have lobbies belonging to it.


### Lobby

  - A Lobby belongs to a Lesson. A lobby is the lowest level of the hierarchy and serves as an instance of a lesson.

  - Lobbies are seperated based on academic year and are then compared in statistics based on this.

  - From this section you can edit a Lesson. Editting a lesson means you can change the name, it's number, the picture
    and its questions.

### Question

  - A Question belongs to a Lesson. A Question can have multiple answers and a time limit.
    An example of a Question would be 'What is the capital of France?' which would then have multiple answers to choose.

  - There are multiple question types:

    - Quickfire Questions: These are complete after the first correct answer. They have multiple answers to choose from,
      while have a time limit set to zero.

    - Open Questions: Open Questions are questions which provide a text box to input unique answers. They are not marked.
      These are complete after a defined time limit which is above zero. They have no answers assigned.

    - Muliple Choice: These have a defined time limit alongside multiple answers.

    - A question is invalid if it lacks a time limit and has no answers. If a question is invalid, users cannot create
      a new lobby.

### Answer

  - An Answer belongs to a Question. An Answer can be correct or incorrect.


### Lobby_Question

  - A Lobby_Question is an instance of a question in a live lobby.

### Response

  - A response is the submitted answer to the Lobby_Question.

### User_Subject

  - Each User has a number of User_Subjects assigned to them based on their responsibilities in Aston.
    User Subjects allow users access to particular subjects. If a user does not have a 'Computer Science' User_Subject,
    they cannot access the 'Computer Science' subject on the platform. Admins are they only ones who have the permission
    to add or take away User Subjects.
