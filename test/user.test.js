
const {describe,expect,test} = require("@jest/globals")

const { validatePassword,validateUserName } = require("../src/services/user.service.js")

describe('::TEST USER SERVICES:::', () => {
  test('Username should not be less than 7 char', async () => {
    const password = validateUserName("abc");
    expect(password).toBe(false);
  });
  test('Username should be at least 7 char', async () => {
    const password = validateUserName("abaabaa");
    expect(password).toBe(true);
  });
  test('Username should not contain space', async () => {
    const password = validateUserName("aba abaa");
    expect(password).toBe(true);
  });
  test('Password should not be less than 7 char', async () => {
    const password  = validatePassword("abc")
    expect(password).toBe(false);
  });
  test('Password should be at least 7 char', async () => {
    const password = validatePassword("abaabaa");
    expect(password).toBe(true);
  });
  test('Password should not be greater than 15 char', async () => {
    const password = validatePassword("testtesttesttest");
    expect(password).toBe(true);
  });
  test('Password should contain at least one special char', async () => {
    const password = validatePassword("Abaabaa@");
    expect(password).toBe(true);
  });
  test('Password should contain at least one capital letter', async () => {
    const password = validatePassword("Abaabaa");
    expect(password).toBe(true);
  });
  test('Password should contain at least one small letter', async () => {
    const password = validatePassword("abaabaa");
    expect(password).toBe(true);
  });
  test('Password should contain at least one  letter', async () => {
    const password = validatePassword("abaabaa");
    expect(password).toBe(true);
  });
});