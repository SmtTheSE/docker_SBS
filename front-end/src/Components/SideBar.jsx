import{ faUser } from "@fortawesome/free-regular-svg-icons";
import {
  faAngleDown,
  faBars,
  faGraduationCap,
  faHome,
  faListCheck,
  faListOl,
  faRoute,
  faXmark,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useState, useEffect } from "react";
import { Link, useLocation } from "react-router-dom";
import { motion } from "framer-motion";
import useAdminSideBar from "../Hook/useAdminSideBar";

const SideBar = () => {
  const location = useLocation();
  const { collapsed, setCollapsed } = useAdminSideBar();
  const [sideBarMenus, setSideBarMenus] = useState([
    {
      id: 1,
      name: "Home",
      icon: faHome,
      link: "/",
      isCurrent: true,
      children: [],
    },
    {
      id: 2,
      name: "Academic",
      icon: faGraduationCap,
      link: "/academic",
      isCurrent: false,
      children: [
        {
          id: 1,
          name: "Study Plan",
          icon: faRoute,
          link: "/study-plan",
          isCurrent: false,
        },
        {
          id: 2,
          name: "Transcripts",
          icon: faListOl,
          link: "/academic/transcripts",
          isCurrent: true,
       },
        {
          id: 3,
          name: "Attendances",
          icon: faListCheck,
          link: "/attendence",
          isCurrent: false,
        },
      ],
    },
    {
      id: 3,
      name: "Profile",
      icon: faUser,
      link: "/profile",
      isCurrent: false,
      children: [
        {
          id: 1,
          name: "Dashboard",
          icon: faHome,
          link: "/profile",
          isCurrent: false,
        },
        {
          id: 2,
          name: "Change Password",
          icon: faUser,
          link: "/change-password",
          isCurrent: false,
        },
],
    },
 ]);

  useEffect(() => {
    const currentPath = location.pathname;
    const updatedMenus = sideBarMenus.map((menu) => {
      let isParentCurrent = false;
      let hasActiveChild = false;

      if (menu.children) {
        hasActiveChild = menu.children.some(
          (child) => currentPath === child.link
        );
        const updatedChildren = menu.children.map((child) => ({
          ...child,
          isCurrent: currentPath === child.link,
        }));

        isParentCurrent = hasActiveChild;

        return {
          ...menu,
          isCurrent: isParentCurrent,
          children: updatedChildren,
        };
      }

      return { ...menu, isCurrent: currentPath === menu.link };
    });

    setSideBarMenus(updatedMenus);
  }, [location.pathname]); // eslint-disable-line react-hooks/exhaustive-deps

  const handleMenus = (id) => {
    setSideBarMenus((prevMenus) =>
      prevMenus.map((menu) =>
        menu.id === id
          ? { ...menu, isCurrent: !menu.isCurrent }
          : { ...menu, isCurrent: false }
      )
    );
  };

  return (
    <motion.nav
      animate={{ width: collapsed ? "6rem" : "18rem" }}
      transition={{ duration: 0.3, ease: "easeInOut" }}
      className={`fixed z-10 bg-gray-900 h-screen flex flex-col justify-start items-start shadow-2xl xs:p-2 md:p-4 overflow-y-auto overflow-x-hidden xs:right-0 xs:${
        collapsed ? "hidden" : "block"
      } md:left-0 md:block transition-all duration-300`}
    >
      <button
        onClick={() => setCollapsed(!collapsed)}
        className="text-gray-300 w-full p-3 rounded-lg hover:bg-gray-700 transition-colors mb-4 flex items-center justify-center xs:hidden md:block"
      >
        {collapsed ? (
          <FontAwesomeIcon icon={faBars} className="w-6 h-6" />
        ) : (
          <FontAwesomeIcon icon={faXmark} className="w-6 h-6" />
        )}
      </button>

      <div className="flex flex-col w-full gap-3">
        {sideBarMenus.map((menu) =>
          menu.children.length === 0 ? (
            <Link
              key={menu.id}
              to={menu.link}
              className={`flex ${
                collapsed ? "justify-center" : "justify-start"
              } items-center gap-3 p-3 rounded-lg transition-colors duration-200 ${
                menu.isCurrent
                  ? "bg-gray-700 text-white"
                  : "text-gray-400 hover:bg-gray-800 hover:text-white"
              }`}
              onClick={() => handleMenus(menu.id)}
            >
              <FontAwesomeIcon icon={menu.icon} className="w-5 h-5 flex-shrink-0" />
              {!collapsed && <span className="whitespace-nowrap font-medium text-sm">{menu.name}</span>}
            </Link>
          ) : (
            <div key={menu.id} className="w-full flex flex-col">
              <div
                className={`flex ${
                  collapsed ? "justify-center" : "justify-between"
                } items-center cursor-pointer p-3 rounded-lg transition-colors duration-200 ${
                  menu.isCurrent
                    ? "bg-gray-700 text-white"
                    : "text-gray-400 hover:bg-gray-800 hover:text-white"
                }`}
                onClick={() => handleMenus(menu.id)}
              >
                <div className="flex items-center gap-3">
                  <FontAwesomeIcon icon={menu.icon} className="w-5 h-5 flex-shrink-0" />
                  {!collapsed && <span className="whitespace-nowrap font-medium text-sm">{menu.name}</span>}
                </div>
                {!collapsed && (
                  <FontAwesomeIcon
                    icon={faAngleDown}
                    className={`w-4 h-4 transition-transform duration-300 ${
                      menu.isCurrent ? "rotate-180" : "rotate-0"
                    }`}
                  />
                )}
              </div>

              <motion.div
                animate={{
                  height: menu.isCurrent && !collapsed ? "auto" : 0,
                  opacity: menu.isCurrent && !collapsed ? 1 : 0,
                  marginTop: menu.isCurrent && !collapsed ? "0.5rem" : 0,
                }}
                transition={{ duration: 0.3 }}
                className="overflow-hidden"
              >
                <div className="flex flex-col gap-2 pl-4">
                  {menu.children.map((child) => (
                    <Link
                      key={child.id}
                      to={child.link}
                      className={`py-2 px-3 rounded-md flex items-center transition-colors duration-200 ${
                        child.isCurrent
                          ? "text-white font-semibold bg-gray-700/50"
                          : "text-gray-400 hover:text-white hover:bg-gray-800"
                      }`}
                      onClick={() => setCollapsed(!collapsed)}
                    >
                      <FontAwesomeIcon icon={child.icon} className="w-4 h-4 mr-3 flex-shrink-0" />
                      {!collapsed && <span className="text-xs">{child.name}</span>}
                    </Link>
                  ))}
                </div>
              </motion.div>
            </div>
          )
        )}
      </div>
    </motion.nav>
  );
};

export default SideBar;