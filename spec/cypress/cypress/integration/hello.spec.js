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

  it('Hits the home page', () => {
    cy.contains('INDECISION');
  })

})
