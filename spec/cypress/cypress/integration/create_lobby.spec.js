/// <reference types="cypress" />

context('Load', () => {
  beforeEach(() => {
    cy.on('uncaught:exception', (err, runnable) => {
      return false
    })
    cy.login();
  })

  it('Creates a Lobby', () => {
    var lobby_name = `Cypress Test ${Date.now()}`;
    cy.contains('Internet Applications and Techniques').parent().parent().siblings('a').click();
    cy.contains('this is a lobby').parent().parent().siblings('a').click();
    cy.contains('Create Lobby').click();
    cy.get('#lobby_name').type(lobby_name);
    cy.get('#lobby_session_date').type('12/2/21');
    cy.contains('Create Lobby').click();
    cy.contains('Room code');
  })

})
