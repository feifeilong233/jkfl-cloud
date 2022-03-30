const LOCAL_JWT_KEY = "jkflcloudjwt";
export const setJwtToken = (jwtToken) => {
    sessionStorage.setItem(LOCAL_JWT_KEY,jwtToken)
}
export const getJwtToken = () => {
    return sessionStorage.getItem(LOCAL_JWT_KEY)
}