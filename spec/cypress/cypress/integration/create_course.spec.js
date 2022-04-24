/// <reference types="cypress" />

context('Load', () => {
  beforeEach(() => {
    cy.on('uncaught:exception', (err, runnable) => {
      return false
    })
    cy.login();
  })

  it('Creates a Course', () => {
    var course_name = `Cypress Test ${Date.now()}`;
    cy.contains('Create Course').click();
    cy.get('#course_name').type(course_name);
    cy.get('#course_module_code').type(`CS${Math.floor(Math.random() * 100000)}`);
    cy.contains('Create Course').click();
    cy.contains(course_name);

  })

})
