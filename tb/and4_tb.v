`timescale 1ns / 1ps

module and4_tb;
  reg  [3:0] a, b;
  wire [3:0] y;

  // Instantiate DUT
  and4 dut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    $dumpfile("sim/waveforms/and4.vcd");
    $dumpvars(0, and4_tb);

    $display("Time\t a\t b\t | y");
    $display("--------------------------------");

    a = 4'b0000; b = 4'b0000; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 4'b1010; b = 4'b0101; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 4'b1111; b = 4'b1111; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 4'b1100; b = 4'b1010; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    $finish;
  end
endmodule
