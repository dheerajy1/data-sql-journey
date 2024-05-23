"use client";

import React, { useEffect, useRef, useState } from "react";
import { CSSProperties } from 'react';

export default function BackgroundDots() {

    const dotContainerRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
        const dotContainer = dotContainerRef.current;
        if (!dotContainer || dotContainer.children.length > 0) return;

        const mathFunctions = [
            Math.sin, Math.cos, Math.tan, Math.acos,
            Math.atan, Math.sinh, Math.cosh, Math.tanh,
            Math.asinh, Math.acosh,
        ];
        const randomFunctionIndex = Math.floor(Math.random() * mathFunctions.length);
        const selectedFunction = mathFunctions[randomFunctionIndex];

        const dotSize = 1; // in pixels
        const spacing = 100;

        const { width, height } = dotContainer.getBoundingClientRect();
        const numRows = Math.min(Math.ceil(height / (dotSize + spacing)), 200);
        const numCols = Math.min(Math.ceil(width / (dotSize + spacing)), 100);

        const styleElement = document.createElement('style');
        styleElement.setAttribute('data-keyframe', 'dynamic-keyframe');
        document.head.appendChild(styleElement);

        const t = `${Math.floor(Math.random() * 14) + 7}`
        const tx = `${['-', '+'][Math.round(Math.random())]}${t}`
        const ty = `${['-', '+'][Math.round(Math.random())]}${t}`

        console.log(tx, ty);
        for (let i = 0; i <= numRows; i++) {
            for (let j = 0; j <= numCols; j++) {
                const keyframeName = `dynamic-keyframe-${i}-${j}`;
                const keyframesRule = `
                @keyframes ${keyframeName} {
                  0%, 100% { transform: translate(0, 0); }
                  50% { 
                    transform: translate(var(--tx), var(--ty));
                    background-color: black;
                    opacity: 0.1; 
                  }
                }
                `;
                styleElement.innerHTML += keyframesRule;
                const dot = document.createElement("div");
                dot.className = "dot";
                dot.style.cssText = `
                    height: ${dotSize}px;
                    width: ${dotSize}px;
                    background-color: black;
                    border-radius: 50%;
                    position: absolute;
                    top: ${i * (dotSize + spacing)}px;
                    left: ${j * (dotSize + spacing)}px;
                    z: -1;
                    animation: ${keyframeName} ${2}s infinite alternate-reverse;
                    animation-delay: ${selectedFunction(i * j) / 2}s;
                `;
                dot.style.setProperty('--tx', `${tx}px`);
                dot.style.setProperty('--ty', `${ty}px`);

                dotContainer.appendChild(dot);
            }
        }
    }, []);

    const dotContainerStyles: CSSProperties = {
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100vw',
        height: '100vh',
        overflow: 'hidden',
        pointerEvents: 'none'
    };

    return (
        <div style={dotContainerStyles} ref={dotContainerRef}>
            {/* Dots will be dynamically added here */}
        </div>
    );
};

