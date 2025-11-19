import React, { useEffect } from 'react'
import Navigation from './Navigation'
import { Outlet, useNavigate } from 'react-router-dom'
import Footer from './Footer'
import SideBar from './SideBar';
import useAdminSideBar from '../Hook/useAdminSideBar';

const MainLayout = () => {
  const navigate = useNavigate();
  const { collapsed } = useAdminSideBar();

  useEffect(() => {
    // Check if user is a guest
    const isGuest = localStorage.getItem("isGuest") === "true";
    
    // If not a guest, check for token
    if (!isGuest) {
      const token = localStorage.getItem("token");
      if (!token) {
        // If no token and not a guest, redirect to login
        navigate("/login");
      }
    }
  }, [navigate]);

  // Check if user is a guest
  const isGuest = localStorage.getItem("isGuest") === "true";

  return (
    <div className="flex">
      <Navigation />
      {!isGuest && <SideBar />}
      <main className={`flex-1 transition-all duration-300 ${isGuest ? 'ml-0' : (collapsed ? "md:ml-24" : "md:ml-72")} p-4`}>
        <div className="mt-20">
          <Outlet />
        </div>
        <Footer />
      </main>
    </div>
  );
};

export default MainLayout