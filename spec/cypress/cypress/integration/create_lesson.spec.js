/// <reference types="cypress" />

context('Load', () => {
  beforeEach(() => {
    cy.on('uncaught:exception', (err, runnable) => {
      return false
    })
    cy.login();
  })

  it('Creates a Course', () => {
    var lesson_name = `Cypress Test ${Date.now()}`;
    cy.contains('Internet Applications and Techniques').parent().parent().siblings('a').click();
    cy.contains('this is a lobby');
    cy.contains('Create Lesson').click();
    cy.get('#lesson_name').type(lesson_name);
    cy.get('#lesson_number').type(`${Math.floor(Math.random() * 100)}`);
    cy.contains('Create Lesson').click();
    cy.contains(lesson_name);
  })

})
