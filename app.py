from flask import Flask, request, jsonify
import pickle



app = Flask(__name__)

# load the saved model
with open('kidney.pkl', 'rb') as f:
    model = pickle.load(f)

# define the endpoint for predicting the kidney disease class
@app.route('/predict_kidney_disease', methods=['POST'])
def predict_kidney_disease():
    # get the input features from the request
    age = request.json['age']
    bp = request.json['bp']
    al = request.json['al']
    su = request.json['su']
    rbc = request.json['rbc']
    pc = request.json['pc']
    pcc = request.json['pcc']
    ba = request.json['ba']
    bgr = request.json['bgr']
    bu = request.json['bu']
    sc = request.json['sc']
    pot = request.json['pot']
    wc = request.json['wc']
    htn = request.json['htn']
    dm = request.json['dm']
    cad = request.json['cad']
    pe = request.json['pe']
    ane = request.json['ane']

    # convert categorical features to numerical
    if rbc == 'normal':
        rbc_num = 0
    elif rbc == 'abnormal':
        rbc_num = 1
    else:
        rbc_num = -1

    if pc == 'normal':
        pc_num = 0
    elif pc == 'abnormal':
        pc_num = 1
    else:
        pc_num = -1

    if pcc == 'present':
        pcc_num = 1
    else:
        pcc_num = 0

    if ba == 'present':
        ba_num = 1
    else:
        ba_num = 0

    if htn == 'yes':
        htn_num = 1
    else:
        htn_num = 0

    if dm == 'yes':
        dm_num = 1
    else:
        dm_num = 0

    if cad == 'yes':
        cad_num = 1
    else:
        cad_num = 0

    # if appet == 'good':
    #     appet_num = 1
    # else:
    #     appet_num = 0

    if pe == 'yes':
        pe_num = 1
    else:
        pe_num = 0

    if ane == 'yes':
        ane_num = 1
    else:
        ane_num = 0

    # create a numpy array with the input features
    input_features = [age, bp,  al, su, rbc_num, pc_num, pcc_num, ba_num, bgr, bu, sc,  pot,wc,  htn_num, dm_num, cad_num,  pe_num, ane_num]

    # make a prediction
    prediction = model.predict([input_features])[0]

    # return the predicted class as a response
    return jsonify({'predicted_class': int(prediction)})


if __name__ == '__main__':
    app.run(debug=True)