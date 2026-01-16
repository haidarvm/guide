sudo dnf install git cmake gcc-c++ libnl3-devel libpcap-devel ncurses-devel
git clone https://github.com/raboof/nethogs.git
cd nethogs

# vim cui.cpp
void Line::show(int row, unsigned int proglen, unsigned int /*devlen*/) {
    assert(m_pid >= 0);
    assert(m_pid <= PID_MAX);

    // Start positions
    const int column_offset_pid = 0;
    const int column_offset_program = column_offset_pid + COLUMN_WIDTH_PID + 1;
    const int column_offset_sent = column_offset_program + proglen + 2;
    const int column_offset_received = column_offset_sent + COLUMN_WIDTH_SENT + 1;
    const int column_offset_unit = column_offset_received + COLUMN_WIDTH_RECEIVED + 1;

    // PID column
    if (m_pid == 0)
        mvaddch(row, column_offset_pid + COLUMN_WIDTH_PID - 1, '?');
    else
        mvprintw(row, column_offset_pid, COLUMN_FORMAT_PID, m_pid);

    // PROGRAM (strip directory path)
    std::string prog = m_name;
    size_t pos = prog.find_last_of('/');
    if (pos != std::string::npos)
        prog = prog.substr(pos + 1);

    mvaddstr_truncate_cmdline(row, column_offset_program, prog.c_str(), m_cmdline, proglen);

    // SENT / RECEIVED
    mvprintw(row, column_offset_sent, COLUMN_FORMAT_SENT, sent_value);
    mvprintw(row, column_offset_received, COLUMN_FORMAT_RECEIVED, recv_value);

    mvaddstr(row, column_offset_unit, desc_view_mode[viewMode]);
}


void Line::log() {
    // Print only PID, program name, sent, and received
    std::cout << m_pid << "\t"
              << m_name << "\t"
              << sent_value << "\t"
              << recv_value << std::endl;
}

# if need -t
void Line::log() {
    std::cout << std::left << std::setw(8) << m_pid
              << std::setw(20) << m_name
              << std::setw(12) << sent_value
              << std::setw(12) << recv_value
              << std::endl;
}


void Line::log() {
    static bool header_printed = false;
    if (!header_printed) {
        std::cout << "PID\tProgram\tSent(KB/s)\tRecv(KB/s)" << std::endl;
        header_printed = true;
    }

    std::cout << m_pid << "\t"
              << m_name << "\t"
              << sent_value << "\t"
              << recv_value << std::endl;
}


cmake .
make
sudo make install