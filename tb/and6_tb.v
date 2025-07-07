`timescale 1ns / 1ps

module and6_tb;
  reg  [5:0] a, b;
  wire [5:0] y;

  // Instantiate DUT
  and6 dut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    $dumpfile("sim/waveforms/and6.vcd");
    $dumpvars(0, and6_tb);

    $display("Time\t a\t b\t | y");
    $display("--------------------------------");

    a = 6'b000000; b = 6'b000000; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 6'b101010; b = 6'b010101; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 6'b111111; b = 6'b111111; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    a = 6'b110011; b = 6'b101010; #10;
    $display("%4t\t %b\t %b\t | %b", $time, a, b, y);

    $finish;
  end
endmodule

