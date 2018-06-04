#!/usr/bin/env node

/**
 * tty.js
 * Copyright (c) 2012-2014, Christopher Jeffrey (MIT License)
 */

process.title = 'tty.js';

var tty = require('../');

var app = tty.createServer({
    shell: 'bash',
    port: 3000
});

app.listen();
