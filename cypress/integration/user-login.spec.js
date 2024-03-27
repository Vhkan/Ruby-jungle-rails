describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('logs in by clickig login and filling in email, and password fields', () => {
    cy.contains('Login').click()
    cy.get('#email').type('am@email.com')
    cy.get('#password').type('123')
    cy.get('.btn').click()
  })
  
});
