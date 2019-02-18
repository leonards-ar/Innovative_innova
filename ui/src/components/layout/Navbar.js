import React from 'react'
import { Link } from 'react-router-dom'

const Navbar = () => {
    return (
        <nav className="nav-wrapper white">
            <div className="container">
                <Link to="#" className="brand-logo right" ><img src="innovative-logo.gif" alt=""/></Link>
            </div>
        </nav>
    )
}

export default Navbar