// load.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test

/// <reference types="cypress" />

context('Load', () => {
  beforeEach(() => {
    cy.visit('http://web:3000')
    cy.on('uncaught:exception', (err, runnable) => {
      return false
    })
  })

  it('Successfully logs in and out', () => {
    cy.contains('Sign in').click();
    cy.get('#user_email').type('fake3@fakemail.com');
    cy.get('#user_password').type('password');
    cy.contains('Log in').click();
    cy.contains('Create Course');
    cy.contains('Homepage').click();
    cy.get('#user-menu-button').click();
    cy.contains('Signout').click();
    cy.contains('Sign in').click();
  })

})
