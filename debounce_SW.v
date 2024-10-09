/*module debounce_SW #(parameter DEBOUNCE_LIMIT = 20)(
    input wire CLK,
    input wire SW,
    output wire SW_debounced
);

    // Will set the width of this counter based on the input parameter    
    reg [DEBOUNCE_LIMIT-1:0] count = 0;
    reg state = 1'b0;
    
    always @(posedge CLK) begin
        // Bouncy input is different than internal state value, so an input is
        // changing.  Increase the counter until it is stable for enough time.  
        if (SW !== state && count < DEBOUNCE_LIMIT-1) begin
            count <= count + 1;
        // End of counter reached, switch is stable, register it, reset counter
        end else if (count == DEBOUNCE_LIMIT-1) begin
            state <= SW;
            count <= 0;
        // Switches are the same state, reset the counter
        end else begin
            count <= 0;
        end
    end
    // Assign internal register to output (debounced!)
    assign SW_debounced = state;

endmodule