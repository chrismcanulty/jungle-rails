describe("Appointments", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article")
      .first()
      .click();
  });



});
