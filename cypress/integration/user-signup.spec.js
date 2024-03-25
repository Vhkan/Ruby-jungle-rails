describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('signs a new user up filling in first_name, last_name, email, password, confirm password fields', () => {
    cy.contains('SignUp').click()
    cy.get('#user_first_name').type('Alex')
    cy.get('#user_last_name').type('Miller')
    cy.get('#user_email').type('AM@email.com')
    cy.get('#user_password').type('111')
    cy.get('#user_password_confirmation').type('111')
    cy.get('.btn-lg').click()  
  })
 
});