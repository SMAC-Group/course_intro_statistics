import React from 'react'
import { StaticQuery, graphql } from 'gatsby'

import SEO from './seo'
import { Link } from './link'
import { H3 } from './typography'
import Logo from '../../static/logo.svg'

import '../styles/index.sass'
import classes from '../styles/layout.module.sass'


const Layout = ({ isHome, title, description, children }) => {
    return (
        <StaticQuery
            query={graphql`
                {
                    site {
                        siteMetadata {
                            title
                            description
                            bio
                            showProfileImage
                            footerLinks {
                                text
                                url
                            }
                        }
                    }
                }
            `}
            render={data => {
                const meta = data.site.siteMetadata
                return (
                    <>
                        <SEO title={title} description={description} />
                        <main className={classes.root}>
                            {!isHome && (
                                <h1 className={classes.logo}>
                                    <Link hidden to="/">
                                        <Logo width={150} height={150} aria-label={meta.title} />
                                    </Link>
                                </h1>
                            )}
                            <div className={classes.content}>
                                {(title || description) && (
                                    <header className={classes.header}>
                                        {title && <h1 className={classes.title}>{title}</h1>}
                                        {description && (
                                            <p className={classes.description}>{description}</p>
                                        )}
                                    </header>
                                )}
                                {children}
                            </div>

                            <footer className={classes.footer}>
                            
                            <div align="center">
                            <H3>About this course:</H3>
                            </div>
                                <div className={classes.footerContent}>
                               
                                    <section className={classes.footerSection}>
                                        

                                        
                                        <p> 
This course is intended to provide an introduction to the data analysis tools with R. These tools include statistical hypothesis testing, (generalized) linear models, machine learning and semi-parametric methods. Applications of these statistical methods are provided in the context of Pharmaceutical Sciences. At the end of this class, students are expected to understand the underlying theoretical foundations and the computational issues of different statistical methods, as well as to communicate the practical interpretation of the data analysis results.
                                        </p>
                                            
                                    </section>
                                    
                                    
                                    
                                    <section className={classes.footerSection}>
                                    
                                        {meta.showProfileImage && (
                                            <img
                                                src="/profile.jpg"
                                                alt=""
                                                className={classes.profile}
                                            />
                                        )}
                                        <p>{meta.bio}</p>
                                    <img src="/licence_2.png" width = '100px' class = "center" />
                                    </section>
                                     
                                     
                                    

                  
                                    

                                    {meta.footerLinks && (
                                        <ul className={classes.footerLinks}>
                                            {meta.footerLinks.map(({ text, url }, i) => (
                                                <li key={i} className={classes.footerLink}>
                                                    <Link variant="secondary" to={url}>
                                                        {text}
                                                    </Link>
                                                </li>
                                            ))}
                                        </ul>
                                    )}
                                </div>
                            </footer>
                        </main>
                    </>
                )
            }}
        />
    )
}

export default Layout
