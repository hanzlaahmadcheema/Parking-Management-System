# 🚗 Parking Management System (8086 Assembly)

A console-based **Parking Management System** developed in **8086 Assembly Language** using DOS interrupt services. This project simulates a real-world parking lot, supporting rikshaws, cars, and buses. Users can park vehicles, select time slots, generate tickets, and manage parking records.

---
      
## 📚 Overview

This project was built for the **Computer Organization & Assembly Language** course at **Riphah International University**. It demonstrates practical use of **x86 Assembly**, focusing on:

- I/O handling via `INT 21h` and `INT 10h`
- Structured procedures
- Register and memory management

---

## 🎯 Features

- Interactive DOS-style text UI
- Park rikshaws, cars, and buses (up to 15 vehicles)
- Custom ticket generation (vehicle type, time slot, ticket ID)
- Time slot selection (4 slots)
- Track total vehicles and revenue
- View complete parking records
- Delete/reset all records
- Input validation and user feedback

---

## 🚀 Getting Started

### Prerequisites

- 16-bit emulator (e.g., **EMU8086**, **DOSBox**, or **TASM**)

### Running the Program

1. Open your IDE (EMU8086, TASM, etc.).
2. Copy the code from `parking-sys.asm` into a new file.
3. Assemble and link:
   ```bash
   tasm parking.asm
   tlink parking.obj
   parking.exe
   ```
4. Run `parking.exe` to start the system.

> 💡 **Tip:** In EMU8086, just hit Compile and Run.

---

## 🧠 Key Concepts

- Register-based memory operations
- Procedure calls (`CALL`, `RET`)
- Input/output with `INT 21h`, `INT 10h`
- Number conversion and printing
- Looping and condition handling
- System message formatting
- Static variables for ticket/record system

---

## 🏫 Educational Context

- **Course:** Computer Organization & Assembly Language
- **University:** Riphah International University, Lahore
- **Semester:** 3rd Semester – BSCS
- **Instructor:** Prof. Amna Bibi
- **Student:** Hanzla Ahmad (Cheemae)

---

## 💻 Technologies Used

- Assembly Language (8086)
- EMU8086 Assembler
- DOS Interrupts: `INT 21h`, `INT 10h`

---

## 👨‍💻 Author

**Hanzla Ahmad**  
BS Computer Science | Software & Web Developer  
[LinkedIn](https://www.linkedin.com/in/hanzlaahmadcheema) | [GitHub](https://github.com/hanzlaahmadcheema)

---

## 🪪 License

Licensed under the MIT License.  
Free to use, modify, and distribute for educational and non-commercial purposes.
