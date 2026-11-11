import React from 'react';
import { createRoot } from 'react-dom/client';
import './style.css';
function App() {
  return <main><h1>React on Kubernetes</h1><h2>Application Successfully Deployed!</h2><p>Running inside a Kubernetes Pod.</p></main>;
}
createRoot(document.getElementById('root')).render(<App />);
