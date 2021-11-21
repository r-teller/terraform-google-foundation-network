
import React from 'react';
import './App.css';

import { Typography, Paper, Container } from "@mui/material";


import NetworkFoundation from "./Schema/NetworkFoundation";

function PageMain() {
    return (
        <div className="App">
            <header className="App-header">
                <Typography component={'h1'} variant={'h6'}>
                    Network Foundation JSON Generator
                </Typography>
            </header>
            <Container className="App-main" maxWidth={'md'} fixed>
                <Paper style={{ margin: 12, padding: 24 }}>
                    <NetworkFoundation />
                </Paper>
            </Container>
        </div>
    );
}

export default PageMain;
