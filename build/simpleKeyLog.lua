print("To exit hold CTRL+T to send Terminate Interrupt")
while true do
    local event, arg1, arg2, arg3 = os.pullEvent()
    print(event, arg1, arg2, arg3)
end
