describe('ruby-jungle-app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('clicks the product partials to navigate to a product details page', () => {
    cy.get(':nth-child(1) > a > img').click()
  })


})

