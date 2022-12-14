/* eslint-disable no-console */
const exchangeCodeForToken = async (code) => {
  // console.log(`MOCK INVOKED: exchangeCodeForToken(${code})`);
  return `MOCK_TOKEN_FOR_CODE_${code}`;
};

// eslint-disable-next-line no-unused-vars
const getGithubProfile = async (token) => {
  //  console.log(`MOCK INVOKED: getGithubProfile(${token})`);
  return {
    login: 'fake_github_user',
    // avatar_url: 'https://www.placecage.com/gif/300/300',
    email: 'test@example.com',
  };
};

module.exports = { exchangeCodeForToken, getGithubProfile };
