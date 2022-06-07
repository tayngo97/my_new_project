import React, { useState, useEffect } from 'react'
import { useNavigate, Link } from 'react-router-dom'
import {
  CButton,
  CCard,
  CCardBody,
  CCardGroup,
  CCol,
  CContainer,
  CForm,
  CFormInput,
  CInputGroup,
  CInputGroupText,
  CRow,
  CImage,
} from '@coreui/react'
import CIcon from '@coreui/icons-react'
import { cilLockLocked, cilUser } from '@coreui/icons'
import axios from 'axios'
import logo from 'src/assets/brand/logo.svg'

const Login = () => {
  const [userName, setUserName] = useState('')
  const [passWord, setPassWord] = useState('')
  const [error, setError] = useState('')
  const [isError, setIsError] = useState(false)
  const navigate = useNavigate()
  useEffect(() => {
    console.log(localStorage.length)
    const length = localStorage.length
    if (length > 0) {
      navigate('/dashboard', { state: { user: userName } })
    }
  }, [])
  const handleLogin = (event) => {
    event.preventDefault()
    const data = {
      username: userName,
      password: passWord,
    }
    axios
      .post('public/login', null, {
        params: {
          username: userName,
          password: passWord,
        },
      })
      .then((res) => {
        if (res.data.status === 'success') {
          localStorage.setItem('token', res.data.responseData.accessToken)
          localStorage.setItem('refreshToken', res.data.responseData.refreshToken)
          localStorage.setItem('userId', res.data.responseData.id)
          localStorage.setItem('expiredAt', res.data.responseData.expiredAt)
          localStorage.setItem('username', userName)
          navigate('/dashboard', { state: { user: userName } })
        } else {
          console.log(res.data.message)
          setIsError(true)
          if (res.data.message === 'Bad credentials') {
            setError('Incorrect Password')
          } else {
            setError(res.data.message)
          }
        }
      })
      .catch((err) => {
        navigate('/500')
      })
  }

  return (
    <div className="bg-light min-vh-100 d-flex flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md={8}>
            <CCardGroup>
              <CCard className="p-4">
                <CCardBody>
                  <CForm>
                    <h1>Login</h1>
                    <p className="text-medium-emphasis">Sign In to your account</p>
                    <CInputGroup className="mb-3">
                      <CInputGroupText>
                        <CIcon icon={cilUser} />
                      </CInputGroupText>
                      <CFormInput
                        onChange={(e) => {
                          setUserName(e.target.value)
                        }}
                        placeholder="Username"
                        autoComplete="username"
                      />
                    </CInputGroup>
                    <CInputGroup className="mb-4">
                      <CInputGroupText>
                        <CIcon icon={cilLockLocked} />
                      </CInputGroupText>
                      <CFormInput
                        onChange={(e) => {
                          setPassWord(e.target.value)
                        }}
                        type="password"
                        placeholder="Password"
                        autoComplete="current-password"
                      />
                    </CInputGroup>
                    {isError && <p className="text-danger">{error}</p>}
                    <CRow>
                      <CCol xs={6}>
                        <CButton onClick={handleLogin} color="dark" className="px-4">
                          Login
                        </CButton>
                      </CCol>
                      <CCol xs={6} className="text-right">
                        <CButton color="link" className="px-0">
                          <Link to="/reset-password"> Reset password?</Link>{' '}
                        </CButton>
                      </CCol>
                    </CRow>
                  </CForm>
                </CCardBody>
              </CCard>
              <CCard className="text-white bg-dark py-5" style={{ width: '44%' }}>
                <CCardBody className="text-center">
                  <CImage
                    rounded
                    thumbnail
                    src="https://scontent.fsgn2-2.fna.fbcdn.net/v/t1.6435-9/51753212_1009411635915332_1047119022539145216_n.png?_nc_cat=103&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=8aZH6ys3tZoAX-rRrng&_nc_ht=scontent.fsgn2-2.fna&oh=00_AT-LiGTOntP9JyJz2mRITYyIWwR0d1XiarSj1OWFIySpOw&oe=62AACD95"
                    width={200}
                    height={200}
                  />
                </CCardBody>
              </CCard>
            </CCardGroup>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  )
}

export default Login
