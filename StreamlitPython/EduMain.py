import streamlit as st
import base64

if 'userStatus' not in st.session_state:
    st.session_state.userStatus=False 

def setStatus():
    st.session_state.userStatus=True 
    


def preHome_UI():
    with open("assets/edumap.png", "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read()).decode()

    # Display the image using Streamlit
    st.write(f"""
        <div style='display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; height: 100%;'>
            <img src="data:image/png;base64,{encoded_string}" height="350" style="margin-bottom: 10px; border-radius: 50%; object-fit: cover;" />
            <p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Connecting the Learners Worldwide</p>
        </div>
    """, unsafe_allow_html=True)

    col1, col2, col3, col4 = st.columns([2, 2, 2, 2])

    if col2.button('Login', use_container_width=True,on_click=setStatus):
        return 'Login'
    if col3.button('SignUp', use_container_width=True, on_click=setStatus):
        return 'SignUp'


def signUp():
    with st.form('SignUp Form',clear_on_submit=False,border=True):
        st.write('''<p style='margin-bottom: 5px; font-size: 16px; font-family: sans-serif; color: green; font-weight: bold'> Login</p>''', unsafe_allow_html=True)
        st.form_submit_button('Register')


def Login():
    pass 


if __name__=='__main__':
    
    status_action=None
    if st.session_state.userStatus==False:
        status_action=preHome_UI()
    if status_action=='Login':
        Login()
    if status_action=='SignUp':
        signUp()
        
    