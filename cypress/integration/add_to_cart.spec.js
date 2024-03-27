describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('test that users can click the Add to Cart button for a product on the home page and the cart increases by one', () => {
    cy.contains('My Cart (0)')
    cy.contains('Add').first().click({force: true})
    cy.contains('My Cart (1)')
  })

});


