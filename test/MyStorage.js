const { expect } = require('chai');

describe('MyStorage', function () {
  it('get number', async function () {
    const signers = await ethers.getSigners();
    const [owner] = await ethers.getSigners();

    const MyStorage = await ethers.getContractFactory('MyStorage');

    const myStorage = await MyStorage.deploy();

    const value = await myStorage.retrieve();
    expect(value).to.equal(0);
  });

  it('store number', async function () {
    const MyStorage = await ethers.getContractFactory('MyStorage');

    const myStorage = await MyStorage.deploy();

    await myStorage.store(1);

    const value = await myStorage.retrieve();

    expect(value).to.equal(1);
  });
});
