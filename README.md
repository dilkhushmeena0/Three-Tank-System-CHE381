# Process Dynamics and Control: Three-Tank System Analysis

## Project Overview

This project presents a comprehensive study of **feedback control system design** for a three non-interacting tanks in series system. The work encompasses both **PID optimization** and **classical PI tuning methods comparison** for the same process, demonstrating the evolution from numerical optimization to classical control theory validation.

**Student:** DILKHUSH MEENA  
**Roll Number:** 220370
**Course:** CHE-381 - Process Dynamics and Control  

***

## 🎯 **Project Objectives**

### **PID Optimization Goals:**
- Optimize PID controller parameters using **Integral Absolute Error (IAE)** minimization
- Achieve optimal transient response for step input
- Validate numerical optimization approach

### *Classical PI Tuning Goals:**
- Compare classical PI tuning methods with optimized PID performance
- Evaluate **Robust Response Time**, **Skogestad IMC**, and **Ziegler-Nichols** methods
- Fine-tune classical methods to approach optimal performance
- Benchmark classical vs. optimization-based approaches

***

## 🏭 **System Description**

### **Process Model:**
Three non-interacting tanks in series with liquid level control:

```
A₁(dh₁/dt) = F₀ - c₁h₁
A₂(dh₂/dt) = c₁h₁ - c₂h₂  
A₃(dh₃/dt) = c₂h₂ - c₃h₃
```

### **Transfer Function:**
```
H₃'(s)/F₀'(s) = K/[(τ₁s+1)(τ₂s+1)(τ₃s+1)]
```

### **System Parameters:**
- **Process Gain (K):** 6
- **Time Constants:** τ₁ = 2s, τ₂ = 4s, τ₃ = 6s
- **Setpoint:** h₃ˢᵖ = 1
- **Simulation Time:** 1000s
- **Sample Time:** 0.1s

***

## 📊 **PID Optimization Results**

### **Performance Criterion Selection:**
**Roll Number 220007 → 7 ÷ 4 = Remainder 3 → ITAE**
*Note: Based on submitted files, IAE was actually used*

### **Optimized PID Parameters:**
| Parameter | Value | Unit |
|-----------|--------|------|
| **Proportional Gain (Kc)** | 15 | - |
| **Integral Time (τᵢ)** | 191.822 | s |
| **Derivative Time (τᴅ)** | 2 | s |

### **Performance Achievement:**
- **IAE Score:** 2.4557
- **Settling Time:** ~40 seconds (from response plot)
- **Overshoot:** Minimal oscillatory behavior
- **Steady-State Error:** Zero (Type 1 system)

### **Response Characteristics:**

- **Rapid initial response** with controlled overshoot
- **Well-damped oscillations** settling quickly
- **Excellent tracking** of setpoint
- **Robust performance** under step input

***

## 🔧 **Classical PI Tuning Comparison**

### **Part A: Classical Methods Evaluation**

#### **Method Performance Ranking:**
| Rank | Method | Kc | τᵢ (s) | IAE Score | Performance |
|------|--------|-----|--------|-----------|-------------|
| 🥇 **1st** | **Ziegler-Nichols Step Response** | 0.060566 | 8.6 | **23.6566** | Best |
| 🥈 **2nd** | **Skogestad IMC** | 0.029138 | 9.9 | **56.6271** | Moderate |
| 🥉 **3rd** | **Robust Response Time** | 0.020795 | 9.8 | **78.544** | Conservative |

#### **Key Observations:**
- **Ziegler-Nichols** provides most aggressive tuning → fastest response
- **Skogestad IMC** offers balanced performance
- **Robust Response Time** prioritizes stability over speed

### **Part B: Fine-Tuned Classical Methods**

#### **Optimized PI Parameters:**
| Method | Original IAE | Improved Kc | Improved τᵢ | **Final IAE** | Improvement |
|--------|-------------|-------------|-------------|---------------|-------------|
| **Skogestad IMC** | 56.6271 | 0.2426 | 9.9 | **8.9638** | **84.2%** ↓ |
| **Ziegler-Nichols** | 23.6566 | 0.2200 | 8.6 | **9.4555** | **60.0%** ↓ |

#### **Tuning Strategy:**
- **Increased proportional gain** (~8× factor) for faster response
- **Maintained integral time** to preserve stability margins
- **Ensured poles remain** in left half-plane for stability

***

## 📈 **Performance Comparison Analysis**

### **Benchmark Comparison:**
| Controller Type | Method | IAE Score | **Relative Performance** |
|----------------|---------|-----------|----------------------|
| **PID** | **Numerical Optimization** | **2.4557** | **Baseline (100%)** |
| **PI** | **Improved Skogestad** | **8.9638** | **265% of baseline** |
| **PI** | **Improved Ziegler-Nichols** | **9.4555** | **285% of baseline** |
| PI | Original Ziegler-Nichols | 23.6566 | 864% of baseline |

### **Key Insights:**
1. **PID optimization** achieves **4× better performance** than best classical PI method
2. **Derivative action** provides significant improvement for this third-order system
3. **Classical methods can be improved** substantially with fine-tuning
4. **Ziegler-Nichols** responds well to aggressive tuning modifications

***

## 🔬 **Technical Implementation**

### **MATLAB Implementation:**
```matlab
%PID Optimization
Kc = 15;
tau_i = 191.822;
tau_d = 2;
sim('Lab_5_CHE381_220007.slx',1000);
IAE = trapz(time,abs(errors));
```

### **Simulink Model Features:**
- **Three-tank transfer function** implementation
- **PID controller** with anti-windup
- **Error signal calculation** for performance metrics
- **Data logging** for post-simulation analysis

### **Performance Metrics:**
- **IAE:** ∫₀ᵗᶠ |ε(t)|dt (Primary metric used)
- **Settling time** analysis from response plots
- **Overshoot** and **oscillation** characteristics
- **Steady-state error** verification

***

## 💡 **Engineering Insights**

### **Controller Design Lessons:**
1. **Numerical optimization** significantly outperforms classical methods
2. **Derivative action** is crucial for higher-order systems (3rd order)
3. **Classical methods** serve as excellent starting points for fine-tuning
4. **Aggressive tuning** can improve performance while maintaining stability

### **System Characteristics:**
- **Third-order system** benefits from derivative control
- **Large integral time** (191.822s) prevents windup in optimized solution
- **Moderate proportional gain** (15) balances speed and stability
- **Step response** reveals well-designed control architecture

### **Practical Applications:**
- **Process control** in chemical plants
- **Level control** systems in tanks and vessels
- **Multi-stage processes** with cascaded dynamics
- **Benchmark testing** for control algorithm validation

***

## 🎯 **Key Achievements**

✅ **Optimal PID Performance:** IAE = 2.4557 (excellent transient response)  
✅ **Classical Method Comparison:** Identified best performing techniques  
✅ **Significant Improvement:** 84% IAE reduction through fine-tuning  
✅ **Stability Preservation:** All designs maintain left half-plane poles  
✅ **Comprehensive Analysis:** Both optimization and classical approaches validated  

***

## 📊 **Final Performance Summary**

**PID:** Best overall performance with **IAE = 2.4557**  
**PI:** Improved classical methods achieving **IAE ≈ 9.0**  
**Performance Gap:** PID provides **~4× better** control performance  
**Engineering Value:** Demonstrates importance of systematic optimization in control design

***

*This project showcases the complete control system design cycle from classical tuning methods to advanced numerical optimization, providing valuable insights into modern process control engineering.*
